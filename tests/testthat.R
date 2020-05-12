library(testthat)
library(homework)

test_that(
  "tests neur",
  {
    expect_equal(neur('€5'), 5)
    expect_equal(neur('€2'), 2)
    expect_equal(neur('€0.00'), 0.00)
    expect_equal(neur('€444,444,444'), 444444444)
    expect_equal(neur('-€99999999999'), -99999999999)
  }
)
