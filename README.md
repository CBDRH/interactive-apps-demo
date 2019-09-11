# Disseminating Research in the 21st Century

### A project funded by the [ARDC](https://ardc.edu.au/)

This repo contains code to build a demonstration Shiny app that illustrates three potential applications of [R Shiny](https://shiny.rstudio.com/) and related packages as platforms to disseminate research.

## Potential use cases

1. As a platform to provide access to research results in an interactive format, which can be used to supplement more traditional publication formats. 

2. As a way to promote reproducible research. Here that is illustrated using the [shinymeta](https://rstudio.github.io/shinymeta/) package.

3. As a way to deliver interactive data science tutorials. Here that is illustrated using the [learnr])https://rstudio.github.io/learnr/ package.


## Key files

* `ui.R` defines the user interface for the Shiny app 

* `server.R` controls the server-side logic

* `global.R` loads neccessary libraries and data

* `data-prep.R` contains code to prepare the ABS mapping and Wage Price Index data utilised in the app, _although the interim files created by this code are not included_.
