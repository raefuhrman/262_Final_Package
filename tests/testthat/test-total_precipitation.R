context("test-total_precipitation")

test_that("rain not negative", {
  expect_true(min(!is.na(climate_data$PRCP))>=0)
})
