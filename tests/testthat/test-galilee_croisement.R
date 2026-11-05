test_that("croisement de deux trains en sens contraires", {
  r <- galilee_croisement(30, 20, 200, 300)
  expect_equal(r$vitesse_relative, 50)
  expect_equal(r$duree, 10)
  expect_equal(r$distance_A, 300)
  expect_equal(r$distance_B, 200)
})

test_that("depassement dans le meme sens", {
  r <- galilee_croisement(30, 20, 200, 300, sens = "meme_sens")
  expect_equal(r$situation, "A depasse B")
  expect_equal(r$duree, 50)
  expect_equal(r$distance_A, 1500)
})

test_that("vitesses egales : aucun depassement", {
  expect_warning(galilee_croisement(20, 20, 100, 100, sens = "meme_sens"))
})

test_that("un sens inconnu est refuse", {
  expect_error(galilee_croisement(30, 20, 200, 300, sens = "autre"))
})
