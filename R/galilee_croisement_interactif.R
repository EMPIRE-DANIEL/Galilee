#' Crossing of two trains in interactive mode
#'
#' Asks for the values in the console, prints the duration and the distances,
#' then offers the animation.
#'
#' @return The result of the computation, invisibly.
#' @export
#' @examples
#' \dontrun{
#' galilee_croisement_interactif()
#' }
galilee_croisement_interactif <- function() {
  saisir <- function(question) {
    valeur <- suppressWarnings(as.numeric(readline(question)))
    if (is.na(valeur)) {
      stop("Please enter numbers only.")
    }
    valeur
  }

  v_a <- saisir("Speed of train A (m/s): ")
  v_b <- saisir("Speed of train B (m/s): ")
  long_a <- saisir("Length of train A (m): ")
  long_b <- saisir("Length of train B (m): ")
  rep_sens <- readline("Same direction? (y/n): ")
  sens <- if (substr(tolower(rep_sens), 1, 1) == "y") "meme_sens" else "opposes"

  resultat <- galilee_croisement(v_a, v_b, long_a, long_b, sens)
  print(resultat)

  reponse <- readline("Show the animation? (y/n): ")
  if (substr(tolower(reponse), 1, 1) == "y") {
    print(galilee_croisement_animation(v_a, v_b, long_a, long_b, sens))
  }
  invisible(resultat)
}

