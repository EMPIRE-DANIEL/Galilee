#' Transformation de Galilee (position)
#'
#' Calcule la position x' dans un referentiel R' en mouvement rectiligne
#' uniforme a la vitesse v par rapport a R.
#'
#' @param x Position dans R (m).
#' @param t Temps (en s).
#' @param v Vitesse de R' par rapport a R(m/s).
#' @return La position x' dans R' (en m).
#' @export
#' @examples
#' galilee_position (x = 100, t = 2, v = 20)
galilee_position <- function(x, t, v){
  x - v * t
}
