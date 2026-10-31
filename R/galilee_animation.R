#' Animation du train et de la balle
#'
#' Montre le train et la balle qui avancent, vus du quai (R) puis
#' vus du train (R').
#'
#' @inheritParams galilee_trajectoire
#' @return Une animation gganimate.
#' @export
#' @examples
#' \dontrun{
#' galilee_animation(u_prime = 5, v = 20)
#' }
galilee_animation <- function(u_prime, v, duree = 5, pas = 0.1) {
  if (!requireNamespace("gganimate", quietly = TRUE)) {
    stop("Le package gganimate est nécessaire pour l'animation.")
  }

  t <- seq(0, duree, by = pas)
  n <- length(t)

  # positions du train et de la balle, vues du quai puis du train
  donnees <- data.frame(
    t = rep(t, 4),
    x = c(v * t, (u_prime + v) * t, rep(0, n), u_prime * t),
    objet = rep(c("Train", "Balle", "Train", "Balle"), each = n),
    vue = rep(c("Vu du quai (R)", "Vu du train (R')"), each = 2 * n)
  )

  ggplot2::ggplot(donnees, ggplot2::aes(x = x, y = objet, colour = objet)) +
    ggplot2::geom_point(size = 6) +
    ggplot2::facet_wrap(~vue, ncol = 1) +
    ggplot2::labs(
      title = paste0("Train à ", v, " m/s, balle à ", u_prime, " m/s dans le train"),
      subtitle = "Temps : {round(frame_time, 1)} s",
      x = "Position (m)",
      y = NULL
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "none") +
    gganimate::transition_time(t)
}
