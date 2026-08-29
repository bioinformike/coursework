
loglike_poiss = function(lam)
{
  sum(dpois(x,lambda = lam, log = TRUE))
}



log_prior_normal = function(mu = 8, sigma = 2)
{
  # Using params from lectures.
  mu_prior = dnorm(mu, mean = 0, sd = 5, log = TRUE)
  sigma_prior = dunif(sigma, min = 0, max = 30, log = TRUE)
  return(mu_prior + sigma_prior)
}


log_post = function(lam)
{
  return(loglike_poiss(lam) + log_prior_normal())
}



proposalFunctionPoiss <- function(theta.old)
{
  max(rnorm(1, mean = theta.old, sd= c(1)),0)
}

mcmc <- function()
{
  N = 100
  sample = rep(NA, N)
  old = 1
  
  for(i in 1:N)
  {
    new = proposalFunctionPoiss(old)
    p = exp(log_post(new) - log_post(old))
    sample[i] = ifelse(runif(1) < p, new, old) 
    old = sample[i]
  }
  
  return(sample)
}

set.seed(100)
print(mcmc())