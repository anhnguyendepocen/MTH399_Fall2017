//Estimate the probability of success in a Bernoulli distribution with beta prior
data {
  int N;                          //sample size
  int<lower=0,upper=1> y[N];      //y consists of N binary values
  real<lower=0> shape1;           //first (positive)  shape parameter
  real<lower=0> shape2;           //second (positive) shape parameter
  
}
parameters {
  real<lower=0,upper=1> theta;    //theta is constrained to be between 0 and 1
}
model {
  theta ~ beta(shape1,shape2);    //beta prior for probability of success theta 
  
  y     ~ bernoulli(theta);       //Bernoulli likelihood given parameter theta
}
