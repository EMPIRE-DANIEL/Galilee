#' Calculs de Galilee par remplissage de valeurs de facon precise(interactif)
#'
#' Pose des questions dans la console, puis calcul de la position et la vitesse dans
#' l'autre referentiel.
#'
#' @return Rien (les resultats sont affiches).
#' @export
galilee_interactif <- function() {
  x <- as.numeric(readline("Position x dans R (m) : "))
  t <- as.numeric(readline("Temps t (s) : "))
  v <- as.numeric(readline("Vitesse v de R' par rapport a R (m/s) : "))
  u_prime <- as.numeric(readline("Vitesse u' de l'objet dans R' (m/s) : "))
  if (anyNA(c(x, t, v, u_prime))){
    stop("Entre uniquement des nombres.")
  }
  cat("Position x' dans R' :", galilee_position(x, t, v), "m\n")
  cat("Vitesse u dans R :",galilee_vitesse(u_prime, v), "m/s\n")
  invisible(NULL)
}
