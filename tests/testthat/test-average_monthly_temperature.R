context("test-average_monthly_temperature")

test_that("monthly average temperature is above freezing in Santa Barbara", {
  expect_true(mean(!is.na(climate_data$TMAX))<=90)
})
