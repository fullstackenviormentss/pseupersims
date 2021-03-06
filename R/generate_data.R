#' Generate survival data for analysis
#'
#' 500 subjects, 20 variables, about 20% cumulative incidence. 5 variables truly associated,
#' some linear, some wonky associations, an interaction, and some variables correlated.
#'
#' @param n Sample size
#'
#' @return A data frame with X variables, censored survival times (competing risk w death), and true cumulative incidence at 26.5 weeks
#'
#' @export


generate_data <- function(n = 500) {

  ## TODO generate multiple x values
  X <- rnorm(n, mean = 1, sd = .1)

  g2 <- exp(.25 + .1 * X + rnorm(n, sd = .1))
  g1 <- exp(2 * X + rnorm(n, sd = .01))

  # ensure that g1 satisfies pweibull(26.5) = .20

  rescl <- mean(26.5 / ((-log(.8)) ^ (1/g2)))

  g1 <- g1 * rescl / mean(g1)

  ## TODO generate competing risk

  Y <- rweibull(n, scale = g1, shape = g2)

  Cen <- pmin(runif(n, 0, 50), 50)

  Tout <- pmin(Y, Cen)
  delta <- Y < Cen

  trueP <- pweibull(26.5, scale = g1, shape = g2)

  data.frame(Tout, delta, X, trueT = Y < 26.5,
             trueP)



}

#' Add pseudo observations to a data frame
#'
#' Allow arbitrary names
#'
#' @param data A data frame with censored survival times for 2 outcomes
#' @return The data frame with pseudo observations added for t = 26.5 weeks
#'
#'
#' @export

add_pseudo_obs <- function(data) {



}
