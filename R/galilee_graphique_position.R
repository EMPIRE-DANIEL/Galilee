#' Graphique des positions
#'
#' Trace la position de la balle au cours du temps, vue du quai (R)
#' et vue du train (R').
#'
#' @inheritParams galilee_trajectoire
#' @return Un graphique ggplot2.
#' @export
#' @examples
#' galilee_graphique_position(u_prime = 5, v = 20)
galilee_graphique_position <- function(u_prime, v, duree = 5, pas = 0.1) {
  donnees <- galilee_trajectoire(u_prime, v, duree, pas)

  ggplot2::ggplot(donnees, ggplot2::aes(x = t, y = x, colour = referentiel)) +
    ggplot2::geom_line(linewidth = 1) +
    ggplot2::labs(
      title = "Position de la balle selon le référentiel",
      x = "Temps (s)",
      y = "Position (m)",
      colour = "Référentiel"
    ) +
    ggplot2::theme_minimal()
}
