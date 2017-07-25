#' Portuguese Bank Direct Marketing Campaign
#'
#' The campaign objective was to persuade targets to make a fixed term deposit.
#'
#' Data originate from from https://archive.ics.uci.edu/ml/datasets/Bank+Marketing.
#'
#' The attributes employment, cpix, ccix, euribor and nemployed give information on social and economic context.
#'
#' There are two data sets:
#'
#' - bankmkt_full: all data
#' - bankmkt_smpl: a 10\% random sample
#'
#' There might be multiple fields for the same target, reflecting multile contacts.
#'
#' @format A data frame with fields:
#' \describe{
#'   \item{age}{age (years)}
#'   \item{job}{type of job}
#'   \item{marital}{marital status}
#'   \item{education}{level of education}
#'   \item{default}{has credit in default?}
#'   \item{housing}{has a housing loan?}
#'   \item{loan}{has a personal loan?}
#'   \item{contact}{mode of previous campaign contact}
#'   \item{month}{month of previous campaign contact}
#'   \item{dow}{day of week of previous campaign contact}
#'   \item{duration}{duration of previous campaign contact (seconds)}
#'   \item{campaign}{number of contacts during campaign}
#'   \item{pdays}{number of days since client was last contacted from a previous campaign}
#'   \item{previous}{number of contacts prior to this campaign}
#'   \item{poutcome}{outcome of the previous marketing campaign}
#'   \item{employment}{employment variation rate}
#'   \item{cpix}{consumer price index}
#'   \item{ccix}{consumer confidence index}
#'   \item{euribor}{EURIBOR rate}
#'   \item{nemployed}{number of citizens employed (thousands)}
#'   \item{subscribed}{did target subscribe?}
#' }
'bankmkt_smpl'

if (FALSE) {
  library(dplyr)

  download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00222/bank-additional.zip",
                "bank-additional.zip")

  prepare_data <- function(df) {
    df = df %>% rename(
      dow = day_of_week,
      employment = emp.var.rate,
      cpix = cons.price.idx,
      ccix = cons.conf.idx,
      euribor = euribor3m,
      nemployed = nr.employed,
      subscribed = y
    ) %>% mutate(
      pdays = ifelse(pdays == 999, NA, pdays)
    )

    levels(df$job)[levels(df$job) == "admin."] <- "admin"

    df
  }

  bankmkt_smpl <- read.table(unz("bank-additional.zip", "bank-additional/bank-additional.csv"),
                             header = TRUE, sep = ";") %>% prepare_data()
  bankmkt_full <- read.table(unz("bank-additional.zip", "bank-additional/bank-additional-full.csv"),
                             header = TRUE, sep = ";") %>% prepare_data()

  devtools::use_data(bankmkt_smpl, overwrite = TRUE)
  devtools::use_data(bankmkt_full, overwrite = TRUE)
}
