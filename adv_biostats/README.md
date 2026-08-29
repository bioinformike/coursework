# adv_biostats — BE7023 Advanced Biostatistics

Coursework from **BE7023: Advanced Biostatistics** at the **University of Cincinnati**, completed during Fall 2018.

Original repository: https://github.com/bioinformike/adv_biostats

## Course overview

BE7023 was an applied graduate biostatistics course centered on regression modeling and statistical analysis in R. The University of Cincinnati's Fall 2018 syllabus describes the course as an applied treatment of regression methods using examples from biomedical and other real-world data, with R used for the computational work.

The published Fall 2018 syllabus includes topics such as simple and multiple linear regression, diagnostics and model selection, transformations and robust regression, penalized and dimension-reduction methods, generalized linear models, multinomial and ordinal regression, classification/regression trees, count models, and mixed models.

This repository contains a subset of the practical coursework from that class, organized as eight R Markdown homework assignments.

## What this repository covers

The preserved assignments include:

- **Simple linear regression**
  - Exploratory summaries and visualization
  - Fitting and interpreting regression models
  - \(R^2\), residual error, confidence intervals, and prediction intervals
  - Transforming variables and back-transforming model results
- **Regression diagnostics and transformations**
  - Log transformations
  - Influence and outlier investigation
  - Comparing fitted relationships across unusual observations
- **ANOVA and multiple comparisons**
  - One-way ANOVA
  - Model assumptions and residual diagnostics
  - Tukey HSD and compact-letter displays
  - Regression/ANCOVA-style adjustment for additional covariates
- **Multiple regression and model selection**
  - Continuous and categorical predictors
  - Dummy-variable interpretation
  - AIC-based backward and forward selection
  - Best-subset regression with `leaps::regsubsets`
  - Comparing model fit and residual error across candidate models
- **Binary logistic regression**
  - Modeling hypertension from smoking, snoring, and obesity
  - Low-birth-weight modeling from maternal characteristics
  - Odds ratios, fitted probabilities, goodness-of-fit, confusion matrices, and misclassification
- **Multinomial and ordinal regression**
  - Multinomial logistic models
  - Proportional-odds models
  - Treating predictors as numeric versus categorical
  - Comparing observed and predicted outcome probabilities
- **Matching and observational-data analysis**
  - Optimal matching with `MatchIt`
  - Matched subclasses
  - Regression and ANOVA after matching

## Repository structure

```text
adv_biostats/
├── hw_1/
├── hw_2/
├── hw_3/
├── hw_4/
├── hw_5/
├── hw_6/
├── hw_7/
└── hw_8/
```

Most directories contain the original `.Rmd` source plus one or more rendered outputs such as PDF, HTML, or Word documents.

## Main tools

- R
- R Markdown / knitr
- `MASS`
- `car`
- `leaps`
- `VGAM`
- `MatchIt`
- `ggplot2`

## Historical note

This is archived coursework rather than a maintained statistical-analysis package. Some package interfaces, datasets, or rendering behavior may differ in current versions of R.

## Course source

University of Cincinnati, **BE7023 / PH7023 Advanced Biostatistics, Fall 2018 syllabus**:

https://med.uc.edu/docs/default-source/environmental-health-docs/division-of-epidemiology/course-descriptions-syllabi/advanced-biostatisticsfff739dbd06b6357af75ff00009c3e1a.pdf?sfvrsn=11a43eb_4
