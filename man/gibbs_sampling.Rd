\name{gibbs_sampling}
\alias{gibbs_sampling}
\title{Gibbs sampling for the inference of the inference of
parameters in the sparse factor analysis model}
\description{This function implements the collapsed Gibbs 
sampling algorithm for the inference of unknown parameters
in the proposed sparse factor analysis model}
\usage{
gibbs_sampling(matrixY1, matrixY2, matrixL1, matrixL2, eta0, 
eta1, alpha_tau = 1, beta_tau = 0.01, tau_sig = 0, max_iter = 1e+05, 
thin = 10, alpha_sigma1 = 0.7, alpha_sigma2 = 0.7, 
beta_sigma1 = 0.3, beta_sigma2 = 0.3, file_name)
}
\arguments{
  \item{matrixY1}{The gene expression matrix, dim(Y1)=G1*J}
  \item{matrixY2}{The drug sensitivity matrix, dim(Y2)=G2*J}
  \item{matrixL1}{The linkage matrix representing prior knowledge
                  about the sparsity pattern of matrixZ1}
  \item{matrixL2}{The linkage matrix representing prior knowledge
                  about the sparsity pattern of matrixZ2}
  \item{eta0}{The probability of having true value of 1 for
              the entries in matrixZ with value 0 in matrixL}
  \item{eta1}{The probability of having true value of 0 for 
              the entries in matrixZ with value 1 in matrixL}
  \item{alpha_tau}{The alpha parameter of Gamma distribution 
                   used for the simulation of noise, default value=1}
  \item{beta_tau}{The beta parameter of Gamma distribution used 
                  for the simulation of noise, default value=0.01}
  \item{tau_sig}{Pre-defined precision of each entry in the factor 
                 loadings matrixW1 and matrixW2, default value=0}
  \item{max_iter}{The number of iterations of the collaped
                  Gibbs sampling algorithm, default=100000}
  \item{thin}{The number of iteration cycle for the record of
              Gibbs samples. For the convenience of storage, the
              result of the Gibbs sampling will be kept every other
              "thin" iterations to alliviate the auto-correlation
              problem between adjacent interations of the Gibbs
              sampling process}
  \item{alpha_sigma1,alpha_sigma2}{If tau_sig=0, the precision 
              of each entry in the factor loading matrixW1 and 
              matrixW2 is not pre-defined, but also treated in 
              a bayesian way. The implemented algorithm will 
              then put a Gamma prior on the precision of matrixW. 
              alpha_sigma1 and alpha_sigma2 are the alpha parameter 
              for the Gamma prior for matrixW1 and 
              matrixW2 respectively}
  \item{beta_sigma1,beta_sigma2}{The alpha parameter for the Gamma prior 
              for matrixW1 and matrixW2 respectively}
  \item{file_name}{The name of the file to store the result of each thinned
                  iteration of the Gibbs sampling}
}

\value{  
  A ".RData" file with the following components:
  \item{matrixZ_chain}{The updated matrixZ in each recorded iteration.A list
       of length 2, for matrixZ1 and matrixZ2 respectively. matrixZ_chain[[1]]
       and matrixZ2[[2]] are both matrices with dimension A*B, whereas A is
       the number of recorded iterations and B the length of matrixZ1/Z2.
       Each row of the matrix corresponds to the vectorized matrixZ1 or
       matrixZ2 in each iteration.}
  \item{matrixW_chain}{The updated matrixW in each recorded iteration, with 
        format similar to matrixZ_chain.}
  \item{matrixX_chain}{The updated matrixX in each recorded iteration. 
        An A*B matrix with each row corresponding to the vectorized 
        matrixX in each recorded iteration.}
  \item{tau_g_chain}{The updated precision of each gene in each itertaion. 
         A list with length 2, containing 2 matrices. Each row corresponds 
         to the updated precision of the G1 or G2 genes in each recorded
         iteration.}
  \item{matrixPr_chain}{Posterior probability for each entry in matrixZ 
          to take value of 1 in each recorded iteration. 
          Also a list of length 2. Each element is a matrix of 
          the same dimension with matrixZ_chain[[1]] or [[2]].}
  \item{label_chain}{A matrix to record the factor labels updated 
          in each iteration. The label index is relative to 
          the starting configuration in the
          Gibbs sampling process, not the true factor labels.}
}

\author{Haisu Ma <haisu.ma@yale.edu>}

\examples{

library(Rlab)
library(MASS)
library(coda)
library(ROCR)

data(matrixY1)
data(matrixY2)
data(matrixL1)
data(matrixL2)

gibbs_sampling(matrixY1, matrixY2, matrixL1, matrixL2, 
eta0=c(0.2,0.2), eta1=c(0.2,0.2), alpha_tau = 1, 
beta_tau = 0.01, tau_sig = 1, max_iter = 50, thin = 10, 
file_name="Demo_Gibbs_result.RData")
      
}


