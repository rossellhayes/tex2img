
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tex2img

<!-- badges: start -->

[![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![License:
MIT](https://img.shields.io/badge/license-MIT-blueviolet.svg)](https://cran.r-project.org/web/licenses/MIT)

<!-- badges: end -->

Convert TeX equations to images using [Sciweavers
iTex2Img](http://www.sciweavers.org/free-online-latex-equation-editor)

## Installation

<!-- You can install the released version of **tex2img** from [CRAN](https://cran.r-project.org/) with: -->

<!-- ```{r eval = FALSE} -->

<!-- install.packages("tex2img") -->

<!-- ``` -->

Or the development version of **tex2img** from
[GitHub](https://github.com/rossellhayes/tex2img) with:

``` r
install_github("rossellhayes/tex2img")
```

## Usage

**tex2img** allows TeX equations to be embedded in Markdown documents
(like GitHub READMEs) as images.

``` r
`r tex2img("\\frac{22}{7}", type = "jpg")`
```

![](http://www.sciweavers.org/tex2img.php?eq=%5Cfrac%7B22%7D%7B7%7D&bc=white&fc=black&im=jpg&fs=8&ff=arev)

A number of options are provided to fine tune the image.

``` r
`r tex2img(
  "\\frac{22}{7}", color = "ForestGreen", background = "RawSienna",
  font = "Modern", size = 18, type = "jpg"
)`
```

![](http://www.sciweavers.org/tex2img.php?eq=%5Cfrac%7B22%7D%7B7%7D&bc=PineGreen&fc=White&im=jpg&fs=18&ff=modern)

-----

Please note that **tex2img** is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
