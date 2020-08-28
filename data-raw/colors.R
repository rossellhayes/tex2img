library(rvest)

tex2img_html <- read_html(
  "http://www.sciweavers.org/free-online-latex-equation-editor"
)

tex2img_colors <- tex2img_html %>%
  html_nodes("select.iListBox:nth-child(3) > option") %>%
  html_text() %>%
  as.character()

tex2img_backgrounds <- tex2img_html %>%
  html_nodes("select.iListBox:nth-child(5) > option") %>%
  html_text() %>%
  as.character()

tex2img_fonts <- tex2img_html %>%
  html_nodes("select.iListBox:nth-child(7) > option") %>%
  html_text() %>%
  as.character() %>%
  tolower()

tex2img_types <- tex2img_html %>%
  html_nodes("select.iListBox:nth-child(11) > option") %>%
  html_text() %>%
  as.character()

usethis::use_data(
  tex2img_colors, tex2img_backgrounds, tex2img_fonts, tex2img_types,
  overwrite = TRUE
)
