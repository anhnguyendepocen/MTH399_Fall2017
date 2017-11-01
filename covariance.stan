//Estimate the perameters of a normal distribution
data {
  int N;                       //sample size is N
  int L;                       //number of levels
  int<lower=1,upper=L> lvl[N]; //level
  real y[N];                   //y consists of N real data values
  real x[N];                   //x is a vector of covariates
}
parameters {
  real beta[L];                //means for levels
  real gamma;
  real<lower=0> sigma;         //dispersion parameter constrained to be nonegative
}
model {
  beta  ~ normal(0,100);       //priors for level means
  gamma ~ normal(0,100);       //prior for common slope
  sigma ~ cauchy(0,10);        //half-cauchy prior for sigma 

  for(i in 1:N){
    y[i] ~ normal(beta[lvl[i]]+gamma*x[i],sigma);
  }
}
