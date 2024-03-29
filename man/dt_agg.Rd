% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dtplyr.R
\name{dt_agg}
\alias{dt_agg}
\title{Aggregate data in the style of data.table}
\usage{
dt_agg(df, ...)
}
\arguments{
\item{df}{An R object that can be coerced to a data.table}

\item{...}{Additional arguments for [.data.table, excluding the first}
}
\value{
data.table
}
\description{
Syntactic sugar for the common case of a dt_op with no filter.
}
\examples{
df <- data.frame(a = c(1, 1, 2, 2, 3, 3), b = 1:6)
dt_agg(df, sum(b), keyby = a)
df \%>\% dt_agg(sum(b), keyby = a)

}
\seealso{
\code{\link{dt_op}}

\code{\link[data.table]{data.table}}
}
