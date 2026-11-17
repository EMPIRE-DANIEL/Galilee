#' Interactive menu
#'
#' Asks for the values in the console, then offers the plot of the positions,
#' the plot of the velocities or the animation. The choices can be repeated
#' and the values can be changed.
#'
#' @return Nothing. The plots are displayed.
#' @export
#' @examples
#' \dontrun{
#' galilee_menu()
#' }
galilee_menu <- function() {
  # reads a number typed in the console
  saisir <- function(question) {
    valeur <- suppressWarnings(as.numeric(readline(question)))
    if (is.na(valeur)) {
      stop("Please enter numbers only.")
    }
    valeur
  }

  # asks the three questions and stores the answers in a list
  demander_valeurs <- function() {
    valeurs <- list(
      u_prime = saisir("Velocity u' of the ball inside the train (m/s): "),
      v = saisir("Speed v of the train relative to the platform (m/s): "),
      duree = saisir("Observation duration (s): ")
    )
    if (valeurs$duree <= 0) {
      stop("The duration must be positive.")
    }
    valeurs
  }

  valeurs <- demander_valeurs()

  # the menu comes back until 0 is typed
  repeat {
    choix <- utils::menu(
      c("Plot of the positions",
        "Plot of the velocities",
        "Animation of the train and the ball",
        "Change the values"),
      title = "\nWhat do you want to see? (0 to quit)"
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

  cat("Goodbye!\n")
  invisible(NULL)
}

