\name{label_chain}
\alias{label_chain}
\docType{data}
\title{Updated factor label configuration during the Gibbs sampling}
\description{A matrix to record the factor labels updated in each iteration.
          The label index is relative to the starting configuration in the
          Gibbs sampling process, not the true factor labels.}
\usage{data(label_chain)}
\format{
  The format is:
 num [1:5, 1:10] 4 4 4 4 4 7 7 7 7 7 ...
}
\examples{
data(label_chain)
}
\keyword{datasets}
