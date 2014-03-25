\name{matrixL1}
\alias{matrixL1}
\docType{data}
\title{The matrix representing prior belief for matrixZ1}
\description{The binary matrix of prior information 
        about gene-pathway associations. Dim(matrixL1)=G1*K.
        For example, matrixL1[g,k]=1 indicates that the g-th gene is known 
        to be associated with the k-th pathway. This information 
        can come from some well-known database, such as KEGG pathway database.}
\usage{data(matrixL1)}
\format{
  The format is:
 num [1:30, 1:10] 0 0 0 0 0 1 0 0 0 0 ...
}
\examples{
data(matrixL1)
}
\keyword{datasets}
