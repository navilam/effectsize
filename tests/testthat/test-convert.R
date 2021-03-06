if (require("testthat") && require("effectsize")) {
  test_that("odds_to_probs", {
    testthat::expect_equal(odds_to_probs(-1.6), 2.66, tolerance = 0.01)
    testthat::expect_equal(odds_to_probs(-1.6, log = TRUE), 0.17, tolerance = 0.01)
    testthat::expect_equal(probs_to_odds(2.66), -1.6, tolerance = 0.01)
    testthat::expect_equal(probs_to_odds(0.17, log = TRUE), -1.6, tolerance = 0.01)
    testthat::expect_equal(odds_to_probs(-1.6, log = TRUE), 0.17, tolerance = 0.01)

    testthat::expect_true(
      ncol(odds_to_probs(
        iris,
        select = c("Sepal.Length"),
        exclude = c("Petal.Length")
      )) == ncol(probs_to_odds(
        iris,
        select = c("Sepal.Length"),
        exclude = c("Petal.Length")
      ))
    )
  })

  test_that("odds_to_d", {
    testthat::expect_equal(odds_to_d(0.2), -0.887, tolerance = 0.01)
    testthat::expect_equal(odds_to_d(-1.45, log = TRUE), -0.7994, tolerance = 0.01)
    testthat::expect_equal(d_to_odds(-0.887), 0.2, tolerance = 0.01)
    testthat::expect_equal(d_to_odds(-0.7994, log = TRUE), -1.45, tolerance = 0.01)
  })


  test_that("d_to_r", {
    testthat::expect_equal(d_to_r(d = 1.1547), 0.5, tolerance = 0.01)
    testthat::expect_equal(r_to_d(r = 0.5), 1.1547, tolerance = 0.01)

    testthat::expect_equal(odds_to_r(odds = d_to_odds(d = r_to_d(0.5))), 0.5, tol = 0.001)
    testthat::expect_equal(odds_to_d(r_to_odds(d_to_r(d = 1), log = TRUE), log = TRUE), 1, tolerance = 0.001)
  })

  test_that("d_to_percentage", {
    testthat::expect_equal(d_to_percentage(d = 1), 0.162, tolerance = 0.01)
    testthat::expect_equal(percentage_to_d(percentage = 0.01), 0.0618, tolerance = 0.01)
  })


  test_that("z_to_percentile", {
    testthat::expect_equal(z_to_percentile(percentile_to_z(0.975)), 0.975, tolerance = 0.001)
  })
}