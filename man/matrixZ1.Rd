\name{matrixZ1}
\alias{matrixZ1}
\docType{data}
\title{The binary indicator matrix for matrixW1}
\description{The binary matrix indicating whether each entry of
        loading matrix W1 is non-zero. For example, matrixZ1[g,k]=1 indicates
        that matrixW1[g,k] is non-zero, and vice versa. Dim(matrixZ1)=G1*K.}
\usage{data(matrixZ1)}
\format{
  The format is:
 num [1:30, 1:10] 0 0 1 0 0 1 0 0 0 0 ...
}
\examples{
data(matrixZ1)
}
\keyword{datasets}
