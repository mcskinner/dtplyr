# Without this hint the bracket operator goes straight to [.data.frame
.datatable.aware <- TRUE

#' Make a new data.table
#'
#' Create a new data.table by copying the underlying data and coercing
#' it to the data.table type. This is a synonym for as.data.table.
#'
#' @param df An R object to coerce to a data.table
#'
#' @return data.table
#'
#' @seealso \code{\link[data.table]{as.data.table}}
#'
#' @examples
#' dt_as(data.frame(a = 1:5))
#'
#' @export
dt_as <- function(df) data.table::as.data.table(df)

#' Run an operation on a data.table
#'
#' Expose data.table's square-bracket-based functionality as a method.
#' This makes it more natural to use with the pipe operator.
#'
#' @param df An R object that can be coerced to a data.table
#' @param ... Additional arguments for [.data.table
#'
#' @return data.table
#'
#' @seealso \code{\link[data.table]{data.table}}
#'
#' @examples
#' df <- data.frame(a = c(1, 1, 2, 2, 3, 3), b = 1:6)
#' dt_op(df, a > 1, sum(b), keyby = a)
#' \dontrun{
#' df %>% dt_op(a > 1, sum(b), keyby = a)
#' }
#'
#' @export
dt_op <- function(df, ...) dt_as(df)[...]

#' Aggregate data in the style of data.table
#'
#' Syntactic sugar for the common case of a dt_op with no filter.
#'
#' @param df An R object that can be coerced to a data.table
#' @param ... Additional arguments for [.data.table, excluding the first
#'
#' @return data.table
#'
#' @seealso \code{\link{dt_op}}
#' @seealso \code{\link[data.table]{data.table}}
#'
#' @examples
#' df <- data.frame(a = c(1, 1, 2, 2, 3, 3), b = 1:6)
#' dt_agg(df, sum(b), keyby = a)
#' \dontrun{
#' df %>% dt_agg(sum(b), keyby = a)
#' }
#'
#' @export
dt_agg <- function(df, ...) dt_as(df)[, ...]

#' Use data.table merge routines to join two tables
#'
#' Coerce the first input to a data.table, and then hand off to the
#' higher performance merge routine.
#'
#' @param df An R object that can be coerced to a data.table
#' @param ... Additional arguments for merge
#'
#' @return data.table
#'
#' @seealso \code{\link[data.table]{merge}}
#'
#' @examples
#' lh <- data.frame(a = 1:5, b = letters[1:5])
#' rh <- data.frame(a = 2:4, c = letters[24:26])
#' dt_merge(lh, rh)
#' \dontrun{
#' lh %>% dt_merge(rh)
#' }
#'
#' @export
dt_merge <- function(df, ...) merge(dt_as(df), ...)
