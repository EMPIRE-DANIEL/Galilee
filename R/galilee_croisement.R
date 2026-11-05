#' Croisement ou dépassement de deux trains
#'
#' Vu depuis le train A, le train A est immobile et le train B arrive à la
#' vitesse relative u' = u - v : c'est la loi d'addition des vitesses lue à
#' l'envers. La fonction donne la durée pendant laquelle les deux trains se
#' recouvrent, de la rencontre des têtes au passage des queues.
#'
#' @param v_a Vitesse du train A par rapport au quai (en m/s).
#' @param v_b Vitesse du train B par rapport au quai (en m/s).
#' @param long_a Longueur du train A (en m).
#' @param long_b Longueur du train B (en m).
#' @param sens "opposes" pour des sens contraires, "meme_sens" sinon.
#' @return Un data.frame : situation, vitesse relative, durée et distances
#'   parcourues par A et B pendant ce temps.
#' @export
#' @examples
#' galilee_croisement(30, 20, 200, 300)
#' galilee_croisement(30, 20, 200, 300, sens = "meme_sens")
galilee_croisement <- function(v_a, v_b, long_a, long_b, sens = "opposes") {
  if (!sens %in% c("opposes", "meme_sens")) {
    stop("sens doit valoir opposes ou meme_sens.")
  }
  if (v_a < 0 || v_b < 0 || long_a <= 0 || long_b <= 0) {
    stop("Les vitesses doivent etre positives et les longueurs strictement positives.")
  }

  # vitesse du train B dans le referentiel du quai, axe x vers la droite
  u_b <- if (sens == "opposes") -v_b else v_b

  # vitesse de B vue depuis le train A : u' = u - v
  u_rel <- galilee_vitesse(u_b, -v_a)

  if (u_rel == 0) {
    warning("Les deux trains ont la meme vitesse : ils ne se croisent jamais.")
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
