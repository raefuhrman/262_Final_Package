context("test-total_precipitation")

test_that("rain not negative", {
  expect_true(min(climate_data$PRCP)>=0)
})
