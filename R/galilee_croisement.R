#' Crossing or overtaking of two trains
#'
#' Seen from train A, train B arrives at the relative speed given by
#' u = u' + v, the Galilean composition of velocities. The two trains overlap
#' from the moment their fronts meet until their rears have passed each other,
#' so the duration is the sum of the two lengths divided by the relative speed.
#'
#' @param v_a Speed of train A relative to the platform, in meters per second.
#' @param v_b Speed of train B relative to the platform, in meters per second.
#' @param long_a Length of train A, in meters.
#' @param long_b Length of train B, in meters.
#' @param sens Use "opposes" for opposite directions (crossing) or
#'   "meme_sens" for the same direction (overtaking).
#' @return A data.frame with the situation, the relative speed (m/s), the
#'   duration of the overlap (s) and the distances covered by A and B during
#'   that time (m).
#' @export
#' @examples
#' galilee_croisement(30, 20, 200, 300)
#' galilee_croisement(30, 20, 200, 300, sens = "meme_sens")
galilee_croisement <- function(v_a, v_b, long_a, long_b, sens = "opposes") {
  if (!sens %in% c("opposes", "meme_sens")) {
    stop("sens must be \"opposes\" or \"meme_sens\".")
  }
  if (v_a < 0 || v_b < 0 || long_a <= 0 || long_b <= 0) {
    stop("Speeds must be positive and lengths strictly positive.")
  }

  # speed of train B on the platform, x axis towards the right
  u_b <- if (sens == "opposes") -v_b else v_b

  # speed of B seen from train A: u' = u - v
  u_rel <- galilee_vitesse(u_b, -v_a)

  if (u_rel == 0) {
    warning("Both trains have the same speed: they never meet.")
    return(data.frame(situation = "aucun depassement", vitesse_relative = 0,
                      duree = Inf, distance_A = NA_real_, distance_B = NA_real_))
  }

  duree <- (long_a + long_b) / abs(u_rel)
  situation <- if (sens == "opposes") {
    "croisement"
  } else if (u_rel < 0) {
    "A depasse B"
  } else {
    "B depasse A"
  }

  data.frame(
    situation = situation,
    vitesse_relative = abs(u_rel),
    duree = duree,
    distance_A = v_a * duree,
    distance_B = v_b * duree
  )
}

