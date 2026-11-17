#' Animation of two trains crossing or overtaking
#'
#' Shows the two trains on two tracks, seen from the platform. The golden
#' zone shows where the two trains overlap. Needs the packages gganimate and
#' gifski.
#'
#' @inheritParams galilee_croisement_positions
#' @return A gganimate animation.
#' @export
#' @examples
#' \dontrun{
#' galilee_croisement_animation(30, 20, 200, 300)
#' }
galilee_croisement_animation <- function(v_a, v_b, long_a, long_b,
                                         sens = "opposes",
                                         avant = 3, apres = 3, pas = 0.1) {
  if (!requireNamespace("gganimate", quietly = TRUE)) {
    stop("Package gganimate is required for the animation.")
  }
  pos <- galilee_croisement_positions(v_a, v_b, long_a, long_b, sens, avant, apres, pas)
  a <- pos[pos$train == "Train A", ]
  b <- pos[pos$train == "Train B", ]

  # zone where the two trains overlap
  zone <- data.frame(t = a$t,
                     xmin = pmax(a$xmin, b$xmin),
                     xmax = pmin(a$xmax, b$xmax),
                     ymin = -0.2, ymax = 2.7)
  zone <- zone[zone$xmin < zone$xmax, ]

  titre <- if (sens == "opposes") {
    "Two trains crossing"
  } else {
    "One train overtaking the other"
  }

  ggplot2::ggplot() +
    ggplot2::geom_rect(data = zone,
                       ggplot2::aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax),
                       fill = "#C8963E", alpha = 0.35) +
    ggplot2::geom_rect(data = pos,
                       ggplot2::aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, fill = train),
                       colour = "#0B2545") +
    ggplot2::scale_fill_manual(values = c("Train A" = "#8DA9C4", "Train B" = "#B5523B")) +
    ggplot2::labs(title = titre,
                  subtitle = "Time: {round(frame_time, 1)} s",
                  x = "Position on the track (m)", y = NULL, fill = NULL) +
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.y = ggplot2::element_blank(),
                   panel.grid.minor = ggplot2::element_blank(),
                   panel.grid.major.y = ggplot2::element_blank()) +
    gganimate::transition_time(t)
}

