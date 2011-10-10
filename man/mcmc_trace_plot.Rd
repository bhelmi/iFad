\name{mcmc_trace_plot}
\alias{mcmc_trace_plot}
\title{Traceplot of the Gibbs sampling iterations}
\description{Plot the updated standard deviation of
    gene in every recorded Gibbs sampling iteration}
\usage{
mcmc_trace_plot(tau_g_chain, plot_file_name, index)
}
\arguments{
  \item{tau_g_chain}{The updated precision of each gene in each itertaion. 
         A list with length 2, containing 2 matrices. Each row corresponds 
         to the updated precision of the G1 or G2 genes in each recorded
         iteration.}
  \item{plot_file_name}{The name of the ".pdf" plot file}
  \item{index}{The index of genes/drugs whose standard
        deviation in each iteration of the Gibbs sampling
        is to be drawn in the trace plot. If there are G1
        genes and G2 drugs in the dataset, "index" can be a
        vector with integer values ranging from 1 to (G1+G2).}
}


\examples{

library(Rlab)
library(MASS)
library(coda)
library(ROCR)

data(tau_g_chain)
mcmc_trace_plot(tau_g_chain,plot_file_name="Demo_traceplot.pdf", index=1:10)

}