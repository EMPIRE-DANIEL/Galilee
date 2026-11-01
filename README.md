# galilee

Un package R pour appliquer la transformation de Galilée : passer des
mesures faites dans un référentiel R à celles d'un référentiel R' qui se
déplace à vitesse constante par rapport à R.

## Installation

```r
install.packages("devtools")
devtools::install_github("EMPIRE-DANIEL/Galilee")
```

Pour l'animation, il faut aussi :

```r
install.packages(c("gganimate", "gifski"))
```

## Utilisation rapide

```r
library(galilee)

galilee_position(x = 100, t = 2, v = 20)   # 60 # A titre d'exemple
galilee_vitesse(u_prime = 5, v = 20)       # 25 # A titre d'exemple
galilee_menu()                             # mode interactif # ici, les valeurs peuvent donc directement etre entree par l'utilisateur, et les resultats se feront en fonction de ces donnees.
```

## Les fonctions

| Fonction | Rôle |
|---|---|
| `galilee_position()` | Position x' dans R' : x' = x - v.t |
| `galilee_vitesse()` | Vitesse u dans R : u = u' + v |
| `galilee_trajectoire()` | Positions au cours du temps dans les deux référentiels |
| `galilee_graphique_position()` | Graphique des positions |
| `galilee_graphique_vitesse()` | Graphique des vitesses |
| `galilee_animation()` | Animation du train et de la balle |  # A titre d'exemple
| `galilee_interactif()` | Calculs en répondant à des questions |
| `galilee_menu()` | Menu : choix du graphique ou de l'animation |

## Le principe

- x' = x - v.t
- t' = t (le temps est le même pour tous)
- u = u' + v
- a' = a (F = ma s'écrit pareil dans les deux référentiels)

Valable quand les vitesses sont très petites devant celle de la lumière.

## Auteur
 
ATANGANA EYANGO DANIEL I, Filiere SDIA Niveau 3 a polytechnique de Douala.

