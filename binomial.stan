//Estimate the probability of success in binomial trials
data {
  int N;                           //sample size
  int trials[N];                   //number of trials for this replication
  int<lower=0> y[N];               //number of successes for this replication
}
parameters {
  real<lower=0, upper=1> p;        //probability of success p
}
model {
  p ~ uniform(0,1);                //uniform prior for p
  
  for (i in 1:N){
    y[i] ~ binomial(trials[i],p);  //binomial likelihood given p
  }
}
