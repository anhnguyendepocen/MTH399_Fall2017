//Estimate the parameters of a gamma distribution
data {
  int N;                     //sample size is N
  real<lower=0> y[N];        //y consists of N reals constrained nonnegative
}
parameters {
  real<lower=0> alpha;       //shape (constrained nonnegative by <lower=0>)
  real<lower=0> beta;        //scale (constrained nonnegative by <lower=0>)
}
model {
  alpha ~ normal(0,50);      //half-normal prior: centered at zero with sd 50
  beta  ~ normal(0,50);      //half-normal prior: centered at zero with sd 50 

  y     ~ gamma(alpha,beta); //gamma likelihood given parameters alpha,beta
}
