#' @details This function requires having a character vector with one or more valid Report Suites specified.
#'
#' @description Get template a report suite is based on for the specified report suites.
#'
#' @title Get Template a Report Suite is Based On
#'
#' @param reportsuite.ids Report suite id (or list of report suite ids)
#'
#' @importFrom jsonlite toJSON
#'
#' @return Data frame
#'
#' @export
#'
#' @examples
#' \dontrun{
#'
#' privacy <- GetPrivacySettings("your_report_suite")
#'
#' privacy2 <- GetPrivacySettings(c("your_dev_suite", "your_prod_suite"))
#'
#' }

GetTemplate <- function(reportsuite.ids) {

  request.body <- c()
  request.body$rsid_list <- reportsuite.ids

  #Hack in locale, every method calls ApiRequest so this hopefully works
  #Set encoding to utf-8 as well; if someone wanted to do base64 they are out of luck
  request.body$locale <- unbox(AdobeAnalytics$SC.Credentials$locale)
  request.body$elementDataEncoding <- unbox("utf8")

  response <- ApiRequest(body=toJSON(request.body),func.name="ReportSuite.GetTemplate")

  return(response)

}