#' Galilean computations in interactive mode
#'
#' Asks for the values in the console, then computes the position x' in R'
#' and the velocity u in R.
#'
#' @return Nothing. The results are printed in the console.
#' @export
galilee_interactif <- function() {
  x <- as.numeric(readline("Position x in R (m): "))
  t <- as.numeric(readline("Time t (s): "))
  v <- as.numeric(readline("Speed v of R' relative to R (m/s): "))
  u_prime <- as.numeric(readline("Velocity u' of the object in R' (m/s): "))
  if (anyNA(c(x, t, v, u_prime))) {
    stop("Please enter numbers only.")
  }
  cat("Position x' in R':", galilee_position(x, t, v), "m\n")
  cat("Velocity u in R  :", galilee_vitesse(u_prime, v), "m/s\n")
  invisible(NULL)
}

