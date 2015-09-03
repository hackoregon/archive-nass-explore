# nass-explore: Exploring the NASS / ARMS Data with R/RStudio
M. Edward (Ed) Borasky  
September 2, 2015  

## Software requirements:
1. R (3.2.2 or later)
2. RStudio (Desktop or Server, v0.99.482 or later)
3. Pandoc (which RStudio should install!)
4. Packages TBD but bare minimum is

    
    ```r
    install.packages(c
      (
        'ggplot2',
        'rmarkdown',
        'tidyr'
      ),
     dependencies = TRUE
    )
    ```
5. I'm hoping to avoid LaTeX / PDF. I install them by default but don't think they should be required!
6. I develop/test/author on (Debian 'stretch') Linux. If something doesn't work on Windows (7 or later) or MacOS X, [***please file an issue!***](https://github.com/hackoregon/nass-explore/issues/new)
