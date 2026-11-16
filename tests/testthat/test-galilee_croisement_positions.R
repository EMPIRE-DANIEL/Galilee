test_that("sens contraires : les deux avants se rencontrent a la date prevue", {
  p <- galilee_croisement_positions(30, 20, 200, 300, avant = 3)
  a <- p[p$train == "Train A", ]
  b <- p[p$train == "Train B", ]
  i <- which.min(abs(a$t - 3))
  expect_equal(a$xmax[i], b$xmin[i])
})

test_that("meme sens : l'avant de A rejoint l'arriere de B", {
  p <- galilee_croisement_positions(30, 20, 200, 300, sens = "meme_sens", avant = 3)
  a <- p[p$train == "Train A", ]
  b <- p[p$train == "Train B", ]
  i <- which.min(abs(a$t - 3))
  expect_equal(a$xmax[i], b$xmin[i])
})

test_that("vitesses egales dans le meme sens : refus", {
  expect_error(galilee_croisement_positions(20, 20, 100, 100, sens = "meme_sens"))
})
