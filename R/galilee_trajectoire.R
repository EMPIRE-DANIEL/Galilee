#'Trajectoire d'une balle vue depuis deux referentiels
#'
#'Une balle est lancee dans un train. La fonction donne sa position
#'au cours du temps, vue du quai (R) et vue du train (R').
#'
#'@param u_prime Vitesse de la balle dans le train (en m/s).
#'@param v Vitesse du train par rapport au  quai (en m/s).
#'@param duree Duree  totale (en s).
#'@param pas Pas de temps (en s).
#'@return Un data.frame avec le temps t, la position x et le referentiel.
#'@export
#' @examples
#'galilee_trajectoire(u_prime = 5, v = 20, duree = 5)
galilee_trajectoire <- function (u_prime, v, duree = 5, pas = 0.1){
  t <- seq(0, duree, by = pas)
  x_quai <- galilee_vitesse(u_prime, v) * t
  x_train <- galilee_position(x_quai, t, v)
  data.frame(
    t = rep(t, 2),
    x = c(x_quai, x_train),
    referentiel = rep(c("Quai (R)", "Train (R')"), each = length(t))
  )
}

