#' Menu interactif
#'
#' Demande les valeurs dans la console, puis propose de tracer le
#' graphique des positions, celui des vitesses, ou l'animation. On peut
#' enchaîner les choix et changer les valeurs.
#'
#' @return Rien (les graphiques sont affichés).
#' @export
#' @examples
#' \dontrun{
#' galilee_menu()
#' }
galilee_menu <- function() {
  # lit un nombre tapé dans la console
  saisir <- function(question) {
    valeur <- suppressWarnings(as.numeric(readline(question)))
    if (is.na(valeur)) {
      stop("Entre uniquement des nombres.")
    }
    valeur
  }

  # pose les trois questions et range les réponses dans une liste
  demander_valeurs <- function() {
    valeurs <- list(
      u_prime = saisir("Vitesse u' de la balle dans le train (m/s) : "),
      v = saisir("Vitesse v du train par rapport au quai (m/s) : "),
      duree = saisir("Durée de l'observation (s) : ")
    )
    if (valeurs$duree <= 0) {
      stop("La durée doit être positive.")
    }
    valeurs
  }

  valeurs <- demander_valeurs()

  # le menu revient jusqu'à ce qu'on tape 0
  repeat {
    choix <- utils::menu(
      c("Graphique des positions",
        "Graphique des vitesses",
        "Animation du train et de la balle",
        "Changer les valeurs"),
      title = "\nQue veux-tu voir ? (0 pour quitter)"
    )

    if (choix == 0) break

    if (choix == 1) {
      print(galilee_graphique_position(valeurs$u_prime, valeurs$v, valeurs$duree))
    } else if (choix == 2) {
      print(galilee_graphique_vitesse(valeurs$u_prime, valeurs$v, valeurs$duree))
    } else if (choix == 3) {
      print(galilee_animation(valeurs$u_prime, valeurs$v, valeurs$duree))
    } else if (choix == 4) {
      valeurs <- demander_valeurs()
    }
  }

  cat("À bientôt !\n")
  invisible(NULL)
}
