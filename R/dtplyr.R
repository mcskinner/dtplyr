dt_as <- data.table::as.data.table
dt_op <- function(df, ...) dt_as(df)[...]
dt_agg <- function(df, ...) dt_as(df)[, ...]
dt_merge <- function(df, ...) merge(dt_as(df), ...)
