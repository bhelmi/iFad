\name{matrixZ_chain}
\alias{matrixZ_chain}
\docType{data}
\title{The updated matrixZ in the Gibbs sampling process}
\description{The updated matrixZ in each recorded iteration.A list
       of length 2, for matrixZ1 and matrixZ2 respectively. matrixZ_chain[[1]]
       and matrixZ2[[2]] are both matrices with dimension A*B, whereas A is
       the number of recorded iterations and B the length of matrixZ1/Z2.
       Each row of the matrix corresponds to the vectorized matrixZ1 or
       matrixZ2 in each iteration.}
\usage{data(matrixZ_chain)}
\format{
  The format is:
List of 2
 $ : num [1:5, 1:300] 0 0 0 1 0 1 1 1 1 0 ...
 $ : num [1:5, 1:300] 1 1 1 1 1 1 1 1 1 1 ...
}
\examples{
data(matrixZ_chain)
}
\keyword{datasets}
