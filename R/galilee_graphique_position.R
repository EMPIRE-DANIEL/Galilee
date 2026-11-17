#' Plot of the positions
#'
#' Plots the position of the ball over time, seen from the platform (R)
#' and seen from the train (R').
#'
#' @inheritParams galilee_trajectoire
#' @return A ggplot2 plot.
#' @export
#' @examples
#' galilee_graphique_position(u_prime = 5, v = 20)
galilee_graphique_position <- function(u_prime, v, duree = 5, pas = 0.1) {
  donnees <- galilee_trajectoire(u_prime, v, duree, pas)

  ggplot2::ggplot(donnees, ggplot2::aes(x = t, y = x, colour = referentiel)) +
    ggplot2::geom_line(linewidth = 1) +
    ggplot2::labs(
      title = "Position of the ball in each reference frame",
      x = "Time (s)",
      y = "Position (m)",
      colour = "Reference frame"
    ) +
    ggplot2::theme_minimal()
}

