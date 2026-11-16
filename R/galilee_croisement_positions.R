#' Positions de deux trains au cours du temps
#'
#' Calcule, vu du quai, la position de l'avant et de l'arriere de chaque
#' train. Le temps est choisi pour que la rencontre ait lieu a t = avant.
#'
#' @inheritParams galilee_croisement
#' @param avant Duree avant la rencontre (en s).
#' @param apres Duree apres la fin du croisement (en s).
#' @param pas Pas de temps (en s).
#' @return Un data.frame : t, train, xmin, xmax, ymin, ymax.
#' @export
#' @examples
#' head(galilee_croisement_positions(30, 20, 200, 300))
galilee_croisement_positions <- function(v_a, v_b, long_a, long_b,
                                         sens = "opposes",
                                         avant = 3, apres = 3, pas = 0.1) {
  if (!sens %in% c("opposes", "meme_sens")) {
    stop("sens doit valoir opposes ou meme_sens.")
  }
  if (v_a < 0 || v_b < 0 || long_a <= 0 || long_b <= 0) {
    stop("Les vitesses doivent etre positives et les longueurs strictement positives.")
  }

  # vitesse relative, comme dans galilee_croisement
  u_b <- if (sens == "opposes") -v_b else v_b
  u_rel <- abs(galilee_vitesse(u_b, -v_a))
  if (u_rel == 0) {
    stop("Les deux trains ont la meme vitesse : rien a animer.")
  }

  duree <- (long_a + long_b) / u_rel
  t <- seq(0, avant + duree + apres, by = pas)

  if (sens == "opposes") {
    # A va vers la droite, B vers la gauche : les avants se rencontrent a t = avant
    a_max <- v_a * t
    a_min <- a_max - long_a
    b_min <- (v_a + v_b) * avant - v_b * t
    b_max <- b_min + long_b
  } else if (v_a > v_b) {
    # A, plus rapide, rattrape B
    a_max <- v_a * t
    a_min <- a_max - long_a
    b_min <- (v_a - v_b) * avant + v_b * t
    b_max <- b_min + long_b
  } else {
    # B, plus rapide, rattrape A
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
