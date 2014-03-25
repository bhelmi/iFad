\name{matrixPr_chain}
\alias{matrixPr_chain}
\docType{data}
\title{The updated posterior probability for matrixZ1&Z2 during Gibbs sampling}
\description{Posterior probability for each entry in matrixZ to take
          value of 1 in each recorded iteration. Also a list of length 2. 
          Each element is a matrix of the same dimension with 
          matrixZ_chain[[1]] or [[2]].}
\usage{data(matrixPr_chain)}
\format{
  The format is:
List of 2
 $ : num [1:5, 1:300] 0.09996 0.00958 0.04389 0.3874 0.11508 ...
 $ : num [1:5, 1:300] 1 1 1 1 1 ...
}
\examples{
data(matrixPr_chain)
}
\keyword{datasets}
