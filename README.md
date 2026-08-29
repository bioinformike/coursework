# data_science — BMIN7054 Data Science for Biomedical Research

Coursework from **BMIN7054: Data Science for Biomedical Research** at the **University of Cincinnati**.

Original repository: https://github.com/bioinformike/data_science

## Course overview

University of Cincinnati describes BMIN7054 as a graduate course in statistical and data-mining techniques for processing, analyzing, and learning from large biomedical datasets. The broader course objectives emphasize practical data handling, predictive modeling, and the integration of methods from bioinformatics, genomics, systems biology, biostatistics, and healthcare data science.

The assignments preserved in this repository combine statistical modeling with biomedical datasets and then expand into model validation, biomarker evaluation, distributed computing, interactive applications, and external biomedical APIs.

## What this repository covers

### Statistical modeling and classification

Homework assignments use R to build and evaluate models on biomedical and clinical datasets, including:

- Binary logistic regression
- Multinomial logistic regression
- Categorical-variable handling and interpretation
- Odds ratios and model coefficients
- Goodness-of-fit
- Confusion matrices and misclassification rates
- Missing-value imputation

### Model validation

The repository includes several approaches to estimating out-of-sample performance:

- 3-fold, 5-fold, and 10-fold cross-validation
- Leave-one-out cross-validation
- Centroid-based classification
- Logistic-regression classification
- Comparison of gene-selection strategies

One project compares classification of **HER2 vs. Luminal A breast cancers** using the first 50 genes, the PAM50 gene set, and all measured genes.

### Biomarkers and diagnostic performance

Assignments using subarachnoid-hemorrhage data explore:

- S100B and NDKA as candidate biomarkers
- Log transformations and density plots
- Receiver-operating-characteristic (ROC) curves
- Area under the curve (AUC)
- Confidence intervals for AUC
- Sensitivity/specificity tradeoffs
- Data-driven diagnostic cutoffs
- Combining multiple predictors into a composite biomarker

### Spark and distributed data analysis

A project uses **sparklyr** with an AWS-hosted Spark/YARN environment to perform k-means clustering on PAM50 breast-cancer expression data.

It includes:

- Moving an R analysis to Spark
- k-means models over a range of cluster counts
- Majority-vote assignment of biological labels
- Misclassification-rate calculations
- Comparison of local and cluster results

### R Shiny and the iLINCS API

A later project builds an interactive workflow for gene-expression signatures:

- Uploading GCT expression files
- Splitting samples based on metadata
- Differential-expression testing with t-tests
- Restricting analysis to L1000 genes
- Selecting the top differentially expressed genes
- Submitting signatures to the iLINCS API
- Retrieving concordant signatures
- Optional heatmap/visualization support

## Repository structure

```text
data_science/
├── homework_1/
├── homework_2/
├── homework_3/
├── homework_4/
├── homework_5/
├── Project_1/
├── Project_2/
└── Project_3/
```

## Main tools

- R / R Markdown
- `caret`
- `pROC`
- `nnet`
- `ggplot2`
- `sparklyr`
- Apache Spark / YARN
- AWS
- R Shiny
- REST APIs / iLINCS

## Historical note

This is archived coursework. Cloud configuration, package APIs, and external services such as iLINCS may have changed since the assignments were completed.

## Course sources

University of Cincinnati course description for **BMIN7054 — Data Science for Biomedical Research**:

https://med.uc.edu/docs/default-source/bmi-docs/biomedical-informatics-certificate-course-descriptions__fall-2020-docx.pdf?sfvrsn=e140df71_4

A later public syllabus copy (Spring 2021) is also available here:

https://www.coursehero.com/file/173377807/CS7054-Course-Syllabusdocx/
