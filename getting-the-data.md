# Downloading NASS/ARMSDB data
M. Edward (Ed) Borasky  
September 3, 2015  

References:

1. NASS data: <http://challengefiles2.blob.core.windows.net/pdf/MSR_Innovation_challenge_NASS_description.pdf>
2. ARMSDB data: <http://challengefiles2.blob.core.windows.net/pdf/MSR_Innovation_challenge_ARMS_description.pdf>

function to download a CSV file


```r
download.csv <- function(url) {
    require(RCurl)
    return(read.csv(text = getURL(url), stringsAsFactors = FALSE))
}
```


Main script


```r
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

    # Get NASS data
    nass.county.oregon <- download.csv(
    'http://nass-api.azurewebsites.net/api/api_get?agg_level_desc=COUNTY&state_name=OREGON&format=csv'
    )
    write.csv(nass.county.oregon,
        file='nass-county-oregon.csv', row.names = FALSE)

    # save compressed RData for later!
    save.image(file = 'nass-arms.RData')
}
```

```
## [1] "arms.crop.production.practices.oregon"
## [2] "download.csv"                         
## [3] "nass.county.oregon"
```


---
title: "getting-the-data.r"
author: "znmeb"
date: "Thu Sep  3 20:09:25 2015"
---
