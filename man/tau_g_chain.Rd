\name{tau_g_chain}
\alias{tau_g_chain}
\docType{data}
\title{The updated tau_g in the Gibbs sampling process}
\description{The updated precision of each gene in each itertaion. 
         A list with length 2, containing 2 matrices. Each row corresponds 
         to the updated precision of the G1 or G2 genes in each recorded
         iteration.}
\usage{data(tau_g_chain)}
\format{
  The format is:
List of 2
 $ : num [1:5, 1:30] 43.7 211.3 12.6 39.6 13.2 ...
 $ : num [1:5, 1:30] 49.5 35.7 53.6 33.1 39.1 ...
}
\examples{
data(tau_g_chain)
}
\keyword{datasets}
