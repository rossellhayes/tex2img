#' Convert TeX equations to images using Sciweavers iTex2Img
#'
#' @param tex A character string of TeX code. Be sure to escape backslashes.
#' @param color A character string for the text color.
#'   Use [tex2img_colors] to see options.
#' @param background A character string for the background color.
#'   Use [tex2img_backgrounds] to see options.
#' @param font A character string for the font face.
#'   Use [tex2img_fonts] to see options.
#' @param size A positive number for the font size.
#' @param type A character string for the output file type.
#'   Use [tex2img_types] to see options.
#'
#' @return The Markdown code to embed an image from Sciweavers iTex2Img
#' @export
#'
#' @examples
#' tex2img("\\frac{22}{7}")
#'
#' tex2img(
#'   "\\frac{355}{113}",
#'   color = "Blue", background = "Yellow",
#'   font = "Modern", size = 18, type = "jpg"
#' )

tex2img <- function(
  tex, color = "black", background = "transparent", font = "arev",
  size = 8, type = "png"
) {
  err_invalid(color,      tex2img_colors)
  err_invalid(background, tex2img_backgrounds)
  err_invalid(font,       tex2img_fonts)
  err_invalid(type,       tex2img_types)

  if (!is.numeric(size) || !size > 0) {
    rlang::abort(paste(code("size"), "must be a positive number."))
  }

  url <- utils::URLencode(
    paste0(
      "http://www.sciweavers.org/tex2img.php",
      "?eq=", tex,
      "&bc=", background,
      "&fc=", color,
      "&im=", type,
      "&fs=", size,
      "&ff=", tolower(font)
    )
  )

  paste0("![", tex, "](", url, ")")
}

err_invalid <- function(arg, list) {
  arg_name  <- rlang::as_name(rlang::ensym(arg))
  list_name <- rlang::as_name(rlang::ensym(list))

  if (!tolower(arg) %in% tolower(list)) {
    rlang::abort(
      c(
        paste0(field(arg), " is not a valid ", code(arg_name), "."),
        paste0("Use ", code(list_name), " to list valid options.")
      )
    )
  }
}

code <- function(x) {
  x <- encodeString(x, quote = "`")

  if (requireNamespace("crayon", quietly = TRUE)) {
    x <- crayon::silver(x)
  }

  x
}

field <- function(x) {
  x <- encodeString(x, quote = '"')

  if (requireNamespace("crayon", quietly = TRUE)) {
    x <- crayon::green(x)
  }

  x
}
