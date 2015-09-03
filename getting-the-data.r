#' ---
#' title: "Downloading NASS/ARMSDB data"
#' author: "M. Edward (Ed) Borasky"
#' date: "September 3, 2015"
#' output:
#'   html_document:
#'     keep_md: true
#' ---
#'
#' References:
#'
#' 1. NASS data: <http://challengefiles2.blob.core.windows.net/pdf/MSR_Innovation_challenge_NASS_description.pdf>
#' 2. ARMSDB data: <http://challengefiles2.blob.core.windows.net/pdf/MSR_Innovation_challenge_ARMS_description.pdf>
#'
#' function to download a CSV file
download.csv <- function(url) {
    require(RCurl)
    return(read.csv(text = getURL(url), stringsAsFactors = FALSE))
}
#'
#' Main script

# Load the data if the saved image exists
if (file.exists('nass-arms.RData')) {
    load('nass-arms.RData')
    ls()
} else {
    #
    # Get ARMSDB crop production practices.
    # Note: there does not appear to be any ARMSDB data for Oregon in the 'Farm
    # Financial Practices' database.
    arms.crop.production.practices.oregon <- download.csv(
    'http://arms-api.azurewebsites.net/api/Crop?fipsStateCode=41&format=csv'
    )
    write.csv(arms.crop.production.practices.oregon,
        file='arms-crop-production-practices.csv', row.names = FALSE)

    # Get NASS census data
    nass.census.county.oregon <- download.csv(
    'http://nass-api.azurewebsites.net/api/api_get?agg_level_desc=COUNTY&state_name=OREGON&source_desc=CENSUS&format=csv'
    )
    write.csv(nass.census.county.oregon,
        file='nass-census-county-oregon.csv', row.names = FALSE)

    # Get NASS survey data
    nass.survey.county.oregon <- download.csv(
    'http://nass-api.azurewebsites.net/api/api_get?agg_level_desc=COUNTY&state_name=OREGON&source_desc=SURVEY&format=csv'
    )
    write.csv(nass.survey.county.oregon,
        file='nass-survey-county-oregon.csv', row.names = FALSE)

    # save compressed RData for later!
    save.image(file = 'nass-arms.RData')
}
