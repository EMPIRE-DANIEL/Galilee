#' Positions of two trains over time
#'
#' Computes, seen from the platform, the position of the front and of the
#' rear of each train. The time origin is chosen so that the fronts meet at
#' the time given by avant.
#'
#' @inheritParams galilee_croisement
#' @param avant Time before the meeting, in seconds.
#' @param apres Time after the end of the overlap, in seconds.
#' @param pas Time step, in seconds.
#' @return A data.frame with the columns t, train, xmin, xmax, ymin and ymax.
#'   Each train is a rectangle from xmin to xmax.
#' @export
#' @examples
#' head(galilee_croisement_positions(30, 20, 200, 300))
galilee_croisement_positions <- function(v_a, v_b, long_a, long_b,
                                         sens = "opposes",
                                         avant = 3, apres = 3, pas = 0.1) {
  if (!sens %in% c("opposes", "meme_sens")) {
    stop("sens must be \"opposes\" or \"meme_sens\".")
  }
  if (v_a < 0 || v_b < 0 || long_a <= 0 || long_b <= 0) {
    stop("Speeds must be positive and lengths strictly positive.")
  }

  # relative speed, as in galilee_croisement
  u_b <- if (sens == "opposes") -v_b else v_b
  u_rel <- abs(galilee_vitesse(u_b, -v_a))
  if (u_rel == 0) {
    stop("Both trains have the same speed: nothing to animate.")
  }

  duree <- (long_a + long_b) / u_rel
  t <- seq(0, avant + duree + apres, by = pas)

  if (sens == "opposes") {
    # A goes right, B goes left: the fronts meet at t = avant
    a_max <- v_a * t
    a_min <- a_max - long_a
    b_min <- (v_a + v_b) * avant - v_b * t
    b_max <- b_min + long_b
  } else if (v_a > v_b) {
    # A, the faster one, catches up with B
    a_max <- v_a * t
    a_min <- a_max - long_a
    b_min <- (v_a - v_b) * avant + v_b * t
    b_max <- b_min + long_b
  } else {
    # B, the faster one, catches up with A
    b_max <- v_b * t
    b_min <- b_max - long_b
    a_min <- (v_b - v_a) * avant + v_a * t
    a_max <- a_min + long_a
  }

  n <- length(t)
  data.frame(
    t = rep(t, 2),
    train = rep(c("Train A", "Train B"), each = n),
    xmin = c(a_min, b_min),
    xmax = c(a_max, b_max),
    ymin = rep(c(0, 1.5), each = n),
    ymax = rep(c(1, 2.5), each = n)
  )
}

