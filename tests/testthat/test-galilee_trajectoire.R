test_that("galilee_trajectoire donne les bonnes positions", {
  d <- galilee_trajectoire(5, 20, duree = 5)
  fin_quai <- tail(d$x[d$referentiel == "Quai (R)"], 1)
  fin_train <- tail(d$x[d$referentiel == "Train (R')"], 1)

  expect_equal(fin_quai, 125)
  expect_equal(fin_train, 25)
  expect_equal(d$x[d$t == 0], c(0, 0))
})

test_that("sans mouvement du train, les deux référentiels coïncident", {
  d <- galilee_trajectoire(8, 0, duree = 3)
  expect_equal(
    d$x[d$referentiel == "Quai (R)"],
    d$x[d$referentiel == "Train (R')"]
  )
})
