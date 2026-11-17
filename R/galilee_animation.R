#' Animation of a train and a ball
#'
#' Shows the train and the ball moving, seen from the platform (R) and then
#' seen from the train (R'). Needs the packages gganimate and gifski.
#'
#' @inheritParams galilee_trajectoire
#' @return A gganimate animation.
#' @export
#' @examples
#' \dontrun{
#' galilee_animation(u_prime = 5, v = 20)
#' }
galilee_animation <- function(u_prime, v, duree = 5, pas = 0.1) {
  if (!requireNamespace("gganimate", quietly = TRUE)) {
    stop("Package gganimate is required for the animation.")
  }

  t <- seq(0, duree, by = pas)
  n <- length(t)

  # positions of the train and of the ball, seen from the platform and the train
  donnees <- data.frame(
    t = rep(t, 4),
    x = c(v * t, (u_prime + v) * t, rep(0, n), u_prime * t),
    objet = rep(c("Train", "Ball", "Train", "Ball"), each = n),
    vue = rep(c("Seen from the platform (R)", "Seen from the train (R')"), each = 2 * n)
  )

  ggplot2::ggplot(donnees, ggplot2::aes(x = x, y = objet, colour = objet)) +
    ggplot2::geom_point(size = 6) +
    ggplot2::facet_wrap(~vue, ncol = 1) +
    ggplot2::labs(
      title = paste0("Train at ", v, " m/s, ball at ", u_prime, " m/s inside the train"),
      subtitle = "Time: {round(frame_time, 1)} s",
      x = "Position (m)",
      y = NULL
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "none") +
    gganimate::transition_time(t)
}

