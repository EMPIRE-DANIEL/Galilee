#' Plot of the velocities
#'
#' Plots the velocity of the ball over time, seen from the platform (R) and
#' seen from the train (R'). The motion is uniform, so the velocities stay
#' constant and the two curves are horizontal lines.
#'
#' @inheritParams galilee_trajectoire
#' @return A ggplot2 plot.
#' @export
#' @examples
#' galilee_graphique_vitesse(u_prime = 5, v = 20)
galilee_graphique_vitesse <- function(u_prime, v, duree = 5) {
  donnees <- data.frame(
    t = rep(c(0, duree), 2),
    vitesse = c(rep(galilee_vitesse(u_prime, v), 2), rep(u_prime, 2)),
    referentiel = rep(c("Quai (R)", "Train (R')"), each = 2)
  )

  ggplot2::ggplot(donnees, ggplot2::aes(x = t, y = vitesse, colour = referentiel)) +
    ggplot2::geom_line(linewidth = 1) +
    ggplot2::expand_limits(y = 0) +
    ggplot2::labs(
      title = "Velocity of the ball in each reference frame",
      x = "Time (s)",
      y = "Velocity (m/s)",
      colour = "Reference frame"
    ) +
    ggplot2::theme_minimal()
}

