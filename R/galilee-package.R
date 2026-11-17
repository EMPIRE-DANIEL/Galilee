#' galilee: Galilean Transformation Between Two Reference Frames
#'
#' Tools to move between two reference frames that move at a constant speed
#' relative to each other. The package applies the Galilean transformation,
#' draws the result, and uses it on a railway problem: how long two trains
#' stay side by side when they cross or when one overtakes the other.
#'
#' @section The four formulas:
#' The frame R' moves at a constant speed `v` along the x axis relative to R.
#'
#' * Position: `x' = x - v * t`
#' * Time: `t' = t`
#' * Velocity: `u = u' + v`
#' * Acceleration: `a' = a`
#'
#' These formulas hold when speeds are very small compared with the speed
#' of light.
#'
#' @section Basic functions:
#' * [galilee_position()] gives the position x' in R' from x, t and v.
#' * [galilee_vitesse()] gives the velocity u in R from u' and v.
#' * [galilee_trajectoire()] gives positions over time in both frames.
#'
#' @section Interactive use and plots:
#' * [galilee_interactif()] asks for values in the console, then computes.
#' * [galilee_graphique_position()] plots the positions of both frames.
#' * [galilee_graphique_vitesse()] plots the velocities of both frames.
#' * [galilee_animation()] animates a train and a ball seen from both frames.
#' * [galilee_menu()] asks for values once, then offers the plots and the
#'   animation in a menu.
#'
#' @section Railway application:
#' Seen from train A, train B arrives at the relative speed given by
#' `u = u' + v`. The crossing time is the sum of the two train lengths
#' divided by that relative speed.
#'
#' * [galilee_croisement()] gives the relative speed, the duration and the
#'   distances covered by both trains.
#' * [galilee_croisement_positions()] gives the position of each train at
#'   each instant.
#' * [galilee_croisement_animation()] animates the two trains and the zone
#'   where they overlap.
#' * [galilee_croisement_interactif()] asks for the values in the console.
#'
#' @examples
#' galilee_position(x = 100, t = 2, v = 20)
#' galilee_vitesse(u_prime = 5, v = 20)
#' galilee_croisement(30, 20, 200, 300)
#' galilee_croisement(30, 20, 200, 300, sens = "meme_sens")
#'
#' @seealso <https://github.com/EMPIRE-DANIEL/Galilee>
#' @aliases galilee
"_PACKAGE"

