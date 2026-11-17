#' Galilean composition of velocities
#'
#' Computes the velocity u of an object in R from its velocity u' in R' and
#' the speed v of R' relative to R: u = u' + v.
#'
#' @param u_prime Velocity of the object in R', in meters per second.
#' @param v Speed of R' relative to R, in meters per second.
#' @return The velocity u of the object in R, in meters per second.
#' @export
#' @examples
#' galilee_vitesse(u_prime = 5, v = 20)
galilee_vitesse <- function(u_prime, v) {
  u_prime + v
}

