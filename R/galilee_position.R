#' Galilean transformation of a position
#'
#' Computes the position x' of a point in a reference frame R' that moves at
#' a constant speed v along the x axis relative to R: x' = x - v * t.
#'
#' @param x Position in R, in meters.
#' @param t Time, in seconds.
#' @param v Speed of R' relative to R, in meters per second.
#' @return The position x' in R', in meters.
#' @export
#' @examples
#' galilee_position(x = 100, t = 2, v = 20)
galilee_position <- function(x, t, v) {
  x - v * t
}

