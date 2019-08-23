test_that("dt_as() makes data.tables", {
  df <- data.frame(a = 1:5, b = 11:15)
  expected <- data.table::data.table(a = 1:5, b = 11:15)
  expect_identical(dt_as(df), expected)
})

test_that("dt_op() can filter", {
  df <- data.frame(a = c(1, 1, 2, 2, 3, 3), b = 1:6)
  expected <- data.table::data.table(a = c(1, 2, 3), b = c(2, 4, 6))
  expect_equal(dt_op(df, b %% 2 == 0), expected)
})

test_that("dt_op() can filter and aggregate", {
  df <- data.frame(a = c(1, 1, 2, 2, 3, 3), b = 1:6)
  expected <- data.table::data.table(a = c(1, 2, 3), V1 = c(2, 7, 11))
  expect_equal(dt_op(df, b > 1, sum(b), a), expected)
})

test_that("dt_op() can aggregate", {
  df <- data.frame(a = c(1, 1, 2, 2, 3, 3), b = 1:6)
  expected <- data.table::data.table(a = c(1, 2, 3), total = c(3, 7, 11))
  expect_equal(dt_op(df, , list(total = sum(b)), a), expected)
})

test_that("dt_agg() can aggregate", {
  df <- data.frame(a = c(1, 1, 2, 2, 3, 3), b = 1:6)
  expected <- data.table::data.table(a = c(1, 2, 3), total = c(3, 7, 11))
  expect_equal(dt_agg(df, list(total = sum(b)), a), expected)
})

test_that("dt_merge() works and dispatches", {
  lh <- data.frame(a = 1:5, b = 11:15)
  rh <- data.frame(a = 2:4, c = 101:103)
  expected <- data.table::setkey(data.table::data.table(a = 2:4, b = 12:14, c = 101:103), a)
  expect_equal(dt_merge(lh, rh), expected)
})
