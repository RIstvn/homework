#' Get USD/Value rate
#'
#' Return info about curency value in USD. Deafult value is EUR.
#'
#'@param x numeric value
#'@param currency INFO
#'@importFrom httr GET content
#'@importFrom logger log_info
#' @export
usd_rate <- function(x, currency="EUR") {
  penzek <-as.numeric(unlist(
    content(GET(paste0('https://api.exchangeratesapi.io/latest?base=', currency, '&symbols=', 'USD')))[[1]]))
  ertek <- x * penzek
  log_info('{x} {currency} is equal to {ertek} USD')
}

#' Return EUR/USD value rate
#'
#'@param x numeric value
#'@return numeric value
#'@importFrom httr GET content
#' @export
convert_to_eur <- function(x){
  euro <-as.numeric(content(GET(paste0('https://api.exchangeratesapi.io/latest?base=', "EUR", '&symbols=', "USD")))[[1]])
  return(euro*x)
}

#' Return string with euro mark from numeric value
#'
#'@param x numeric value
#'@return character string
#' @export
eur <- function(x){
  return(paste0('€', format(round(x, 2), nsmall=1, big.mark=",")))
}


#' Return numeric value from euro value srting with euro mark.
#'
#'@param eurstring character string
#'@return character string
#' @export
neur <- function(eurstring){
  options("scipen"=100, "digits"=4)
  return(as.numeric(gsub("€","",gsub(',',"",eurstring))))
}




library(devtools)

use_testthat()
