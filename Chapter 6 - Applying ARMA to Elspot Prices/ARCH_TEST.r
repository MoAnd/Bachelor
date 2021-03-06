# ARCH - TEST

#This code is an implementation of the LM Test described in Section 4.4.3

ARCH_TEST = function(residuals , lags , save = TRUE, cat = TRUE) {
  #browser()
  n = length(residuals)
  
  residuals = residuals^2
 
  X = c()
  
  for( i in 0:(lags-1)){
    X = cbind( X , residuals[(1+i):(n-lags+i)])
  }
  
  fit = lm( residuals[(1+lags):n] ~ X )
  
  R2 = summary(fit)$r.squared
  
  LM = n*R2
  
  p_value = 1 - pchisq(LM ,df = lags)
  
  if(cat){cat("p-value =", p_value,"\t", "Statistic =", LM, sep = " ")
  cat("\n")}
  
  if(save){return(p_value)}
  
}
