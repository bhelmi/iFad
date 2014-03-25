\name{matrixL2}
\alias{matrixL2}
\docType{data}
\title{The matrix representing prior belief for matrixZ2}
\description{The binary matrix of prior information 
        about drug-pathway associations. Dim(matrixL2)=G2*K.
        For example, matrixL2[g,k]=1 indicates that the g-th drug is known 
        to be associated with the k-th pathway. This information 
        can come from some well-known database, such as KEGG pathway database.}
\usage{data(matrixL2)}
\format{
  The format is:
 num [1:30, 1:10] 0 0 1 0 1 0 0 0 0 0 ...
}
\examples{
data(matrixL2)
}
\keyword{datasets}
