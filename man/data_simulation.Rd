\name{data_simulation}
\alias{data_simulation}
\title{Simulation of example dataset for the factor analysis model}
\description{Simulation of gene expression data, drug sensitivity data, 
             as well as gene-pathway association matrix}
\usage{
data_simulation(K, G1, G2, J, eta0, eta1, density, 
alpha_tau = 1, beta_tau = 0.01, SNR = 0, file_name)
}
\arguments{
  \item{K}{Number of latent factors (pathways)}
  \item{G1}{Number of genes in matrixY1}
  \item{G2}{Number of drugs in matrixY2}
  \item{J}{Number of samples (for example, cell lines)}
  \item{eta0}{The probability of having true value of 1 
         for the entries in matrixZ with value 0 in matrixL}
  \item{eta1}{The probability of having true value of 0 for 
         the entries in matrixZ with value 1 in matrixL}
  \item{density}{Density of prior-information matrixL}
  \item{alpha_tau}{The alpha parameter of Gamma distribution 
         used for the simulation of noise, default value=1}
  \item{beta_tau}{The beta parameter of Gamma distribution used 
         for the simulation of noise, default value=0.01}
  \item{SNR}{The signal-to-noise ratio, which the ratio of the 
            variance of individual genes to the variance 
            of the noise term, default value=0}
  \item{file_name}{The name of the simulated data file}
}
\details{When SNR is set to some non-zero value, alpha_tau and 
   beta_tau will not be used for the simulation of noise term}
\value{
  A ".RData" file with the following components:
  \item{matrixL1,matrixL2}{The binary matrix of prior information 
        about gene/drug-pathway associations. Dim(matrixL1)=G1*K,
        Dim(matrixL2)=G2*K. For example, matrixL1[g,k]=1 indicates 
        that the g-th gene is known to be associated with the k-th 
        pathway. This information can come from some well-known 
        database, such as KEGG pathway database.}
  \item{matrixPi1,matrixPi2}{The matrix with the bernoulli probability for 
        binary matrixZ1 and matrixZ2.Therefore, 
        matrixPi[g,k]=P(matrixZ[g,k]==1).
        Dim(matrixPi1)=G1*K,Dim(matrixPi2)=G2*K. 
        These two matrix are determined 
        by matrixL1,L2 and eta0, eta1.}
  \item{matrixX}{The factor activity matrix with dimension K*J. 
        matrixX[k,j] is the activity value of the k-th latent factor 
        (e.g., pathway) in the j-th sample (e.g., cell line). 
        Real continuous value with mean 0 and SD 1.}  
  \item{matrixW1,matrixW2}{The factor loading matrix representing 
        the degree of influence of the latent factors on 
        individual genes/drugs. Dim(matrixW1)=G1*K; 
        Dim(matrixW2)=G2*K. Real continuous value with mean 0 and SD 1.}
  \item{matrixY1,matrixY2}{The paired gene expression and drug response matrix
        measured across the same set of samples (cell lines). Dim(matrixY1)=G1*J.
        Dim(matrixY2)=G2*J.}
  \item{matrixZ1,matrixZ2}{The binary matrix indicating whether each entry of
        loading matrix W1 and W2 is non-zero. 
        For example, matrixZ1[g,k]=1 indicates
        that matrixW1[g,k] is non-zero, and vice versa. 
        Dim(matrixZ1)=G1*K. Dim(matrixZ2)=G2*K.}
  \item{sigma1,sigma2}{The positive-definite symmetric matrix specifying 
        the covariance matrix of the noise term associated with each gene or drug.
        Dim(sigma1)=G1*G1. Dim(sigma2)=G2*G2.}
  \item{Y1_mean,Y2_mean}{The matrix of the mean value of matrixY 
        before adding the noise term.Calculated by the multiplication 
        of matrixW and matrixX.
        Dim(Y1_mean)=G1*J. Dim(Y2_mean)=G2*J.}

}
\author{Haisu Ma <haisu.ma@yale.edu>}

\examples{

data_simulation(K=10,G1=30,G2=30,J=15,eta0=c(0.2,0.2),
eta1=c(0.2,0.2), density=c(0.1,0.1),alpha_tau=1,
beta_tau=0.01,SNR=0,file_name="demo_data.RData")

}


