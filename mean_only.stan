//Estimate the parameters of a mean-only model with normal data
data {
  int N;                         //sample size is N
  real y[N];                     //y consists of N real data values
}
parameters {
  real beta_0;                   //location parameter
  real<lower=0> sigma;           //dispersion parameter constrained to be nonegative
}
model {
  beta_0  ~ normal(0,100);       //normal prior for mu: centered at zero with sd=100 
  sigma   ~ cauchy(0,10);        //uniform prior for sigma 

  y     ~ normal(\beta_0,sigma); //normal likelihood given parameters (mu,sigma)
}
