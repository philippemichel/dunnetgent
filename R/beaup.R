#' Petit p bien presenté
#'
#' @param varp p.value
#' @param affp if TRUE the output will be like "p = 0.005" else simply "0,005" (default : FALSE)
#'
#' @return beaup , chaine de caractère
#'
#' @import stats
#' @export
#'
#' @examples
#' pp <- cor.test(iris$Sepal.Length,iris$Sepal.Width)
#' beaup(pp$p.value)
#'
#'
beaup <- function(varp, affp = FALSE) {
  if (varp < 0.0011) {
    if (affp) {
      beaup <- "p < 0.001"
    }
    else {
      beaup <- "< 0.001"
    }
  }
  else {
    beaup <- round(varp, 3)
    if (affp) {
      beaup <- paste0("p = ", beaup)
    }
  }
  return(beaup)
}
