# galilee

An R package that applies the Galilean transformation: it converts the
measurements made in a reference frame R into the measurements of a frame R'
that moves at a constant speed relative to R.

## Installation

```r
install.packages("remotes")
remotes::install_github("EMPIRE-DANIEL/Galilee")
```

For the animations, also install:

```r
install.packages(c("gganimate", "gifski"))
```

## Quick start

```r
library(galilee)

galilee_position(x = 100, t = 2, v = 20)    # 60
galilee_vitesse(u_prime = 5, v = 20)        # 25
galilee_menu()                              # interactive menu
galilee_croisement(30, 20, 200, 300)        # two trains crossing
```

## Functions

- `galilee_position()`: position x' in R', x' = x - v * t.
- `galilee_vitesse()`: velocity u in R, u = u' + v.
- `galilee_trajectoire()`: positions over time in both frames.
- `galilee_interactif()`: asks for values in the console, then computes.
- `galilee_graphique_position()`: plot of the positions.
- `galilee_graphique_vitesse()`: plot of the velocities.
- `galilee_animation()`: animation of a train and a ball.
- `galilee_menu()`: menu to enter values and choose a plot or the animation.
- `galilee_croisement()`: duration and distances when two trains cross or one overtakes the other.
- `galilee_croisement_positions()`: position of each train over time.
- `galilee_croisement_animation()`: animation of the two trains and their overlap.
- `galilee_croisement_interactif()`: the same, asking for the values in the console.

## Main formulas

- x' = x - v * t
- t' = t
- u = u' + v
- a' = a

They hold when the speeds are very small compared with the speed of light.

## Author

ATANGANA EYANGO Daniel, ENSPD, Douala.

