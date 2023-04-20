#' dunnettgent
#'
#'Khi2 modified by Dunnett & Gent for non-inferiority tests, very often used in clinical studies.
#'
#' @param dfx a data.frame or a tibble
#' @param vin binary variable that may affect the result
#' @param vout binary variable success/fail
#' @param success leel of vout for success
#' @param delta non-inferiority limit
#' @param corcont corrected for continuity ? (default : FALSE)
#'
#' @import dplyr
#' @import forcats
#' @import stats
#'
#' @return khi2 and p-value
#' @export
#'
#' @examples df <- dplyr::tibble(trait = c("a","b","a"), alive = c("yes", "yes", "no"))
#' dunnettgent(dfx = df, vin = trait, vout = alive, success = "yes", delta = 0.1, corcont = TRUE)
#'
dunnettgent <- function(dfx,vin,vout,success,delta, corcont = FALSE){
  if (corcont) {
    corcont = 0.5
  } else {corcont = 0}
  zz <-  dfx |>
    dplyr::reframe(vin = {{vin}}, vout ={{vout}})
  zz$vout <- zz$vout |>  forcats::fct_relevel(success)
  zz <- table(zz$vout, zz$vin)
  #
  totlig <- margin.table(zz, 1)
  O <- totlig[[1]]
  totcol <- margin.table(zz, 2)
  dobs <- zz[[1, 1]] / totcol[[1]] - zz[1, 2] / totcol[[2]]
  if (dobs > (delta * -1)) {
    delta <- delta * -1
  }
  pin <- (O + totcol[[2]] * delta) / (totcol[[1]] + totcol[[2]])
  en <- pin * totcol[[1]]
  pir <- (O - totcol[[1]] * delta) / (totcol[[1]] + totcol[[2]])
  er <- pir * totcol[[2]]
  #
  dx2 <- (abs(zz[[1,1]]-en)-0.5)^2
khi2 <- dx2*(1/en + 1/er + 1 /(totcol[[1]]-en) + 1 /(totcol[[2]]-er))
pk <- 1-stats::pchisq(khi2,1)
  return(list(khi2 = round(khi2,3), p.value = beaup(pk, affp = 1)))
}
