test_that("galilee_vitesse additionne les vitesses", {
  expect_equal(galilee_vitesse(5, 20), 25)
  expect_equal(galilee_vitesse(-5, 20), 15)
  expect_equal(galilee_vitesse(-20, 20), 0)
})
