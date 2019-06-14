context("test-average_monthly_temperature")

test_that("monthly average temperature is above freezing in Santa Barbara", {
  expect_that(min(!is.na(average_temp))>=32)
})
