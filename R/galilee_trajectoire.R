#' Positions of a ball seen from two reference frames
#'
#' A ball is thrown inside a train. The function gives its position over
#' time, seen from the platform (R) and seen from the train (R').
#'
#' @param u_prime Velocity of the ball inside the train, in meters per second.
#' @param v Speed of the train relative to the platform, in meters per second.
#' @param duree Total duration, in seconds.
#' @param pas Time step, in seconds.
#' @return A data.frame with the time t, the position x and the reference
#'   frame (column referentiel).
#' @export
#' @examples
#' galilee_trajectoire(u_prime = 5, v = 20, duree = 5)
galilee_trajectoire <- function(u_prime, v, duree = 5, pas = 0.1) {
  t <- seq(0, duree, by = pas)
  x_quai <- galilee_vitesse(u_prime, v) * t
  x_train <- galilee_position(x_quai, t, v)
  data.frame(
    t = rep(t, 2),
    x = c(x_quai, x_train),
    referentiel = rep(c("Quai (R)", "Train (R')"), each = length(t))
  )
}

