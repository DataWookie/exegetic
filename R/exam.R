#' Hours of study related to passing an exam
#'
#' A group of 100 students spend between 0 and 12 hours studying for an exam.
#' How does the number of hours spent studying affect the probability that the
#' student will pass?
#'
#' @format A data frame with 100 records and 2 variables:
#' \describe{
#'   \item{hours}{hours spent studying;}
#'   \item{pass}{pass (1) or fail (0).}
#' }
"exam"

if (FALSE) {
  library(dplyr)

  alpha = 1
  beta  = - 6

  set.seed(13)
  #
  N = 100
  #
  exam <- data.frame(hours = runif(N, 0, 12)) %>%
    mutate(
      pass = ifelse(1 / (1 + exp(- alpha * hours - beta)) > 0.5 + rnorm(N, sd = 0.25), 1, 0),
      hours = round(hours, 1)
    )

  devtools::use_data(exam, overwrite = TRUE)
}
