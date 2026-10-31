#' Graphique de la position d'une balle dans deux référentiels
#'
#' Trace la position de la balle au cours du temps, vue du quai (R)
#' et vue du train (R'). Avec animer = TRUE, le tracé se dessine
#' progsressivement.
#'
#' @inheritParams galilee_trajectoire
#' @param animer TRUE pour obtenir une animation.
#' @return Un graphique ggplot2 (ou une animation gganimate).
#' @export
#' @examples
#' galilee_graphique(u_prime = 5, v = 20)
galilee_graphique <- function(u_prime, v, duree = 5, pas = 0.1, animer = FALSE) {
  # on récupère les positions dans les deux référentiels
  donnees <- galilee_trajectoire(u_prime, v, duree, pas)

  g <- ggplot2::ggplot(donnees, ggplot2::aes(x = t, y = x, colour = referentiel)) +
    ggplot2::geom_line(linewidth = 1) +
    ggplot2::labs(
      title = "Position de la balle selon le référentiel",
      x = "Temps (s)",
      y = "Position (m)",
      colour = "Référentiel"
    ) +
    ggplot2::theme_minimal()

  # animation : le tracé apparaît petit à petit
  if (animer) {
    if (!requireNamespace("gganimate", quietly = TRUE)) {
      stop("Le package gganimate est nécessaire pour l'animation.")
    }
    g <- g + ggplot2::geom_point(size = 3) + gganimate::transition_reveal(t)
  }
  g
}

#' Graphique en mode interactif
#'
#' Pose des questions dans la console puis trace le graphique.
#'
#' @return Rien (le graphique est affiché).
#' @export
galilee_graphique_interactif <- function() {
  u_prime <- as.numeric(readline("Vitesse u' de la balle dans le train (m/s) : "))
  v <- as.numeric(readline("Vitesse v du train par rapport au quai (m/s) : "))
  duree <- as.numeric(readline("Durée de l'observation (s) : "))
  reponse <- readline("Animation ? (o/n) : ")

  if (anyNA(c(u_prime, v, duree)) || duree <= 0) {
    stop("Entre des nombres, avec une durée positive.")
  }

  animer <- tolower(reponse) == "o"
  print(galilee_graphique(u_prime, v, duree, animer = animer))
  invisible(NULL)
}
