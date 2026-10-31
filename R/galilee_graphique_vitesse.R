#' Graphique des vitesses
#'
#' Trace la vitesse de la balle au cours du temps, vue du quai (R)
#' et vue du train (R'). Le mouvement est uniforme, donc les vitesses
#' restent constantes.
#'
#' @inheritParams galilee_trajectoire
#' @return Un graphique ggplot2.
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
      title = "Vitesse de la balle selon le référentiel",
      x = "Temps (s)",
      y = "Vitesse (m/s)",
      colour = "Référentiel"
    ) +
    ggplot2::theme_minimal()
}
