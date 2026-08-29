# comp_stats_work — BE7024 Computational Statistics

Coursework from **BE7024: Computational Statistics** at the **University of Cincinnati**.

Original repository: https://github.com/bioinformike/comp_stats_work

## Course overview

BE7024 is an applied graduate course in statistical computing with R. A University of Cincinnati syllabus from a later offering describes the course as advanced R for data manipulation, visualization, simulation, and modern statistical methods, with explicit emphasis on random-number generation, Monte Carlo methods, bootstrap methods, and cross-validation.

The 2017 coursework preserved in this repository follows that computational-statistics theme closely, progressing from R fundamentals through simulation and visualization to rejection sampling, Bayesian MCMC, and bootstrap inference.

## What this repository covers

### R data handling and exploratory analysis

Early assignments introduce practical statistical computing in R:

- Inspecting data frames
- Variable classes and summary statistics
- Tables and cross-tabulations
- Row/column proportions
- Writing reusable R functions
- Missing-value handling
- `apply`-family operations
- Grouped summaries

### Simulation and probability

Assignments use simulation to study statistical behavior, including:

- Drawing random samples from known distributions
- Comparing simulated and observed distributions
- Weighted random sampling
- Monte Carlo investigation of coin-toss patterns
- Estimating geometric area with random points
- Demonstrating convergence as simulation size increases

### Data visualization

The repository includes both base R and `ggplot2` work:

- Histograms and density curves
- Scatterplots and regression lines
- Multi-panel figures
- Aesthetic mappings
- LOESS smoothing
- Exploring the effect of smoothing parameters

### Monte Carlo and rejection sampling

One assignment implements:

- Monte Carlo estimation of a rhombus area
- Uniform point generation within a constrained region
- Rejection sampling
- Proposal distributions
- Acceptance rates
- Comparison of simulated samples with the target density

### Bayesian computation and MCMC

A Bayesian homework covers:

- Likelihood and prior functions on the log scale
- Posterior calculation
- Poisson modeling
- Metropolis-Hastings
- 10,000-iteration MCMC chains
- Posterior point estimates
- Credible intervals
- Effective sample size
- Monte Carlo convergence diagnostics
- A parallel implementation/example in WinBUGS

### Bootstrap inference

The final preserved homework implements bootstrap methods for:

- Mean and median
- Bias and mean squared error
- Margins of error
- Confidence intervals for means and variances
- Correlation
- Regression coefficients
- Pair-resampling versus residual-resampling approaches

## Repository structure

```text
comp_stats_work/
├── Homework1/
├── Homework2/
├── Homework3/
├── Homework4/
├── Homework5/
├── Homework6/
├── working.R
├── temp.R
└── writeDatafileR.R
```

## Main tools

- R
- R Markdown
- `ggplot2`
- `LearnBayes`
- Monte Carlo simulation
- Metropolis-Hastings / MCMC
- Bootstrap resampling
- WinBUGS examples

## Historical note

This is archived coursework from 2017. Some externally sourced helper scripts, package APIs, or URLs referenced by the assignments may no longer be available exactly as written.

## Course source

University of Cincinnati syllabus for a later offering of **BE7024 / PH7024 — Computational Statistics** (Spring 2019):

https://med.uc.edu/docs/default-source/environmental-health-docs/division-of-epidemiology/course-descriptions-syllabi/computational-statistics.pdf?sfvrsn=41358a29_4
