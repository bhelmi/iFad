\name{Ymean_compare}
\alias{Ymean_compare}
\title{Compare the infered Y_mean values with the true values}
\description{Calculate the RMSE (root-mean-sqaured-error) of
      the inferred mean of matrixY1 and matrixY2 compared with
      the original true means of matrixY1 and Y2}
\usage{
Ymean_compare(Y1_mean,Y2_mean,matrixY1, matrixY2, 
matrixZ_chain, matrixW1, matrixW2, matrixW_chain, 
matrixX, matrixX_chain, result_file_name, plot_name)
}
\arguments{
  \item{Y1_mean,Y2_mean}{The matrix of the mean value of 
        matrixY before adding the noise term. Calculated 
        by the multiplication of matrixW and matrixX.
        Dim(Y1_mean)=G1*J,Dim(Y2_mean)=G2*J.}
  \item{matrixY1,matrixY2}{The paired gene expression 
        and drug response matrix measured across the 
        same set of samples (cell lines). Dim(matrixY1)=G1*J.
        Dim(matrixY2)=G2*J.}
  \item{matrixZ_chain}{The updated matrixZ in each recorded 
       iteration. A list of length 2, for matrixZ1 and 
       matrixZ2 respectively. matrixZ_chain[[1]] and matrixZ2[[2]] 
       are both matrices with dimension A*B, whereas A is
       the number of recorded iterations and B the length of 
       matrixZ1/Z2. Each row of the matrix corresponds 
       to the vectorized matrixZ1 or matrixZ2 in each iteration.}
  \item{matrixW1,matrixW2}{The factor loading matrix representing 
        the degree of influence of the latent factors on individual 
        genes. Dim(matrixW1)=G1*K; Dim(matrixW2)=G2*K. 
        Real continuous value with mean 0 and SD 1.}
  \item{matrixW_chain}{The updated matrixW in each recorded 
        iteration, with format similar to matrixZ_chain.}
  \item{matrixX}{The factor activity matrix with dimension K*J. 
        matrixX[k,j] is the activity value of the k-th latent 
        factor (e.g., pathway) in the j-th sample (e.g., cell line). 
        Real continuous value with mean 0 and SD 1.}  
  \item{matrixX_chain}{The updated matrixX in each recorded iteration. 
        An A*B matrix with each row corresponding to the vectorized 
        matrixX in each recorded iteration.}
  \item{result_file_name}{Name of the ".RData" file for storing
          the RMSE related result}
  \item{plot_name}{Name of the ".pdf" file for plotting RMSE}


}

\value{
    The generated .RData file includes the following components:
    \item{scaled_Y1_mean,scaled_Y2_mean}{The mean of matrixY1 and Y2 
          after data normalization (prior to the Gibbs sampling,
          the original matrixY1 and matrixY2 are normalized, so their
          mean will change), with dimension the same to that of 
          matrixY1 and matrixY2}
    \item{est_Y1_mean_chain,est_Y2_mean_chain}{Estimated mean of 
          matrixY1 and matrixY2 in each iteration of the Gibbs 
          sampling algorithm.Each row corresponds to the vectorized
          estimated mean of matrixY1 or matrixY2}
    \item{RMSE_Y_MEAN}{Root-mean-squared-error of the estimation. 
          A matrix of two columns. The first column records the
          RMSE for the mean of matrixY1 in each iteration of the 
          Gibbs sampling process and the second column records 
          that of matrixY2}
}

\examples{


library(Rlab)
library(MASS)
library(coda)
library(ROCR)

data(Y1_mean)
data(Y2_mean)
data(matrixY1)
data(matrixY2)
data(matrixZ_chain)
data(matrixW1)
data(matrixW2)
data(matrixW_chain)
data(matrixX)
data(matrixX_chain)
Ymean_compare(Y1_mean,Y2_mean,matrixY1, matrixY2, 
matrixZ_chain, matrixW1, matrixW2, matrixW_chain, 
matrixX, matrixX_chain, result_file_name="RMSE_demo.RData", 
plot_name="RMSE_plot.pdf")

}