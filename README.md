# coursework

A monorepo of graduate coursework completed during PhD training at the **University of Cincinnati**, together with a separate statistical-learning exercise repository.

The individual projects were originally maintained as separate Git repositories and are collected here to keep the coursework, code, and history organized in one place.

## Courses and repositories

| Directory | Course | Focus | Primary tools |
|---|---|---|---|
| [`adv_biostats/`](adv_biostats/) | **BE7023 — Advanced Biostatistics** | Applied regression, ANOVA, model selection, logistic/multinomial/ordinal models, matching | R, R Markdown |
| [`stat-learning/`](stat-learning/) | **Statistical Learning Exercises** | Exercises and notes from *An Introduction to Statistical Learning*, Chapters 2–10 | R, R Markdown |
| [`bioinf/`](bioinf/) | **BMIN7099 — Introduction to Bioinformatics** | Sequence analysis, tandem repeats, gene prediction, dynamic-programming alignment, protein secondary-structure prediction | Python, Bowtie, NumPy, scikit-learn |
| [`data_science/`](data_science/) | **BMIN7054 — Data Science for Biomedical Research** | Classification, cross-validation, biomarkers/ROC analysis, Spark/AWS, Shiny, iLINCS | R, Spark, Shiny |
| [`hc_db/`](hc_db/) | **BE8093 — Introduction to Database Management Systems** | SQL/SQLite, CouchDB/NoSQL, REST, biomedical database applications, VAERS dashboard | SQL, R, CouchDB, Shiny |
| [`par_comp_work/`](par_comp_work/) | **CS6068 — Parallel Computing** | CPU multiprocessing, CUDA kernels, GPU image processing, tiling/shared memory, reductions and scans | Python, CUDA C/C++ |
| [`comp_stats_work/`](comp_stats_work/) | **BE7024 — Computational Statistics** | Simulation, visualization, rejection sampling, MCMC, bootstrap inference | R, R Markdown |

## Repository map

```text
coursework/
├── adv_biostats/
├── stat-learning/
├── bioinf/
├── data_science/
├── hc_db/
├── par_comp_work/
└── comp_stats_work/
```

Each directory has its own README with a more detailed description of the course and the assignments preserved in that repository.

## Highlights

Across the repositories, the coursework spans several layers of computational biomedical research:

- **Biostatistics:** regression, ANOVA, generalized linear models, categorical outcomes, model selection, matching, ROC/AUC analysis, and resampling
- **Statistical learning:** regression, classification, cross-validation, regularization, nonlinear models, tree methods, SVMs, PCA, and clustering
- **Bioinformatics:** genome sequence searching, repeat detection, ORF/gene prediction, dynamic-programming alignment, and protein secondary-structure prediction
- **Biomedical data science:** gene-expression classification, PAM50 analysis, distributed Spark workloads, interactive Shiny applications, and biomedical APIs
- **Data engineering:** relational SQL, SQLite, NoSQL/CouchDB, REST/JSON, and database-backed visualization
- **Parallel computing:** Python multiprocessing and CUDA programming, including thread/block mapping, shared memory, tiling, reductions, histograms, and scans
- **Computational statistics:** Monte Carlo simulation, rejection sampling, Metropolis-Hastings MCMC, and bootstrap inference

## About the code

These repositories are **historical coursework**, not actively maintained production packages. They intentionally preserve the code largely as it was written for the assignments.

As a result, some projects may contain:

- Old local file paths
- Package APIs that have since changed
- Older Python/R syntax
- Historical CUDA assumptions
- External services or endpoints that are no longer available
- Generated assignment outputs alongside source code

Those artifacts are retained because they document the original work and computing environment.

## Course information

Course descriptions were cross-checked against publicly available University of Cincinnati syllabi, program handbooks, and course descriptions where available. The individual repository READMEs contain the relevant course-source links and distinguish exact-semester material from later public course descriptions.

The `stat-learning` repository is the exception: no UC course identity is asserted for it, and its README is based only on the repository contents and its stated use of *An Introduction to Statistical Learning*.
