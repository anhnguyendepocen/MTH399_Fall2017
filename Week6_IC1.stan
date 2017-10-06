//Estimate the parameters of a normal distribution
data {
  int N;                    //sample size is N
  real y[N];                //y consists of N real data values
}
parameters {
  real mu;                  //location parameter
  real<lower=0> sigma;      //dispersion parameter constrained to be nonegative
}
model {
  mu    ~ normal(105,100);    //normal prior for mu: centered at zero with sd=100 
  sigma ~ normal(0,20);       //half-normal prior for sigma 

  y     ~ normal(mu,sigma); //normal likelihood given parameters (mu,sigma)
}
