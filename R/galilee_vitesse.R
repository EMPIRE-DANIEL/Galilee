#' Composition des vitesses (Galilee)
#'
#' Calcule la vitesse u d'un objet dans R a partir de sa vitesse u' dans R' et
#' de la vitesse v de R' par rapport a R.
#'
#' @param u_prime Vitesse de l'objet dans R' (en m/s).
#' @param v Vitesse de R' par rapport a R (en m/s).
#' @return La vitesse u de l'objet dans R (m/s).
#' @export
#' @examples
#' galilee_vitesse (u_prime = 5, v =20)
galilee_vitesse <- function(u_prime, v){
  u_prime + v
}
