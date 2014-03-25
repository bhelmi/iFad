\name{ROC_plot}
\alias{ROC_plot}
\title{Calculate the AUC (area under curve) and generate ROC plot}
\description{This function evaluates the inference performance of 
       the sparse factor analysis model by using different cut-off 
       values to calculate the sensitivity and specificity of the 
       result of the Gibbs sampling algorithm. In this way, it can
       give the AUC (area under curve) value and plot the 
       receiver-operating-curve.}
\usage{
ROC_plot(matrixZ1, matrixZ2, matrixZ_chain, 
plot_name, result_file_name, burn)
}
\arguments{
  \item{matrixZ1,matrixZ2}{The binary matrix indicating whether 
        each entry of loading matrix W1 and W2 is non-zero. 
        For example, matrixZ1[g,k]=1 indicates that matrixW1[g,k] 
        is non-zero, and vice versa. Dim(matrixZ1)=G1*K.
        Dim(matrixZ2)=G2*K.}
  \item{matrixZ_chain}{The updated matrixZ in each recorded iteration.
       A list of length 2, for matrixZ1 and matrixZ2 respectively. 
       matrixZ_chain[[1]] and matrixZ2[[2]] are both matrices 
       with dimension A*B, whereas A is the number of recorded 
       iterations and B the length of matrixZ1/Z2. Each row of 
       the matrix corresponds to the vectorized matrixZ1 or
       matrixZ2 in each iteration.}
  \item{plot_name}{The name of the ".pdf" file of the plot}
  \item{result_file_name}{The name of the ".RData" file which stores
          the result of the performance evaluation.}
  \item{burn}{The number of iteration taken as the starting 
          point for the inference of the unknown values 
          in the model. For example,if burn=101, samples from 
          the 101-th iteration to the final iteration of the 
          Gibbs sampling process will be averaged for the inference.}
}


\examples{


library(Rlab)
library(MASS)
library(coda)
library(ROCR)


data(matrixZ1)
data(matrixZ2)
data(matrixZ_chain)
ROC_plot(matrixZ1, matrixZ2, matrixZ_chain, plot_name="ROC_plot.pdf", 
result_file_name="ROC_result.RData", burn=1)


}

