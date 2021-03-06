% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/replicate.R
\name{run_one_replicate}
\alias{run_one_replicate}
\title{Run one replicate of the experiment}
\usage{
run_one_replicate(seed = floor(runif(1 * 1000)), output = "repouput.rds")
}
\arguments{
\item{seed}{random seed (integer)}

\item{output}{path to output file}
}
\description{
Generates data, analyzes the results in different ways, runs the perturbation algorithm,
and returns the output in a sensible manner.
}
