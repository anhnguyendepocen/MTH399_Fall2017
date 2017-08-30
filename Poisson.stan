//Estimate the parameter of a Poisson distibution
data {
  int N;                  //sample size
  int<lower=0> y[N];      //y values: integers, constrained to be nonnegative
  real prior_sd;          //standard deviation for half-normal prior
}
parameters {
  real<lower=0> lambda;   //parameter is constrained nonnegative by <lower=0>
}
model {
  lambda ~ normal(0,prior_sd); //half-normal prior centered at zero with sd 100
  y ~ poisson(lambda);         //Poissonn likelihood with parameter lambda
}
