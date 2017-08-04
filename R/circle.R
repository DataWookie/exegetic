#' A circle of red points in a plane of blue points
#'
#' @format A data frame with 100 records and 2 variables:
#' \describe{
#'   \item{x}{x coordinate;}
#'   \item{y}{y coordinate;}
#'   \item{colour}{either "red" or "blue".}
#' }
"circle"

if (FALSE) {
  library(dplyr)

  N <- 300
  circle <- data.frame(
    x = runif(N, -1.5, 1.5),
    y = runif(N, -1.5, 1.5)
  ) %>% mutate(
    colour = factor(ifelse(sqrt(x**2 + y**2) + rnorm(N, sd = 0.125) < 1, "red", "blue"))
  )

  devtools::use_data(circle, overwrite = TRUE)
}
