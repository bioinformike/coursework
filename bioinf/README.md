# bioinf — BMIN7099 Introduction to Bioinformatics

Coursework from **BMIN7099: Introduction to Bioinformatics** at the **University of Cincinnati**.

Original repository: https://github.com/bioinformike/bioinf

## Course overview

University of Cincinnati course materials describe BMIN7099 as a multidisciplinary graduate introduction to the algorithmic and computational methods used in data-rich biomedical research. Public UC course descriptions identify biological sequence analysis, deep sequencing, gene-expression modeling, protein/macromolecular structure and function, systems biology, and practical use of standard bioinformatics tools as major areas of the course.

The code preserved here is strongly algorithmic and project-based. It progresses from sequence searching and genome feature detection through gene prediction and dynamic-programming alignment to machine-learning prediction of protein secondary structure.

## What this repository covers

### Project 1 — Tandem-repeat discovery

Python code generates exhaustive libraries of short nucleotide sequences and uses **Bowtie** indexes to search *Bacillus anthracis* Ames and Sterne genomes.

The project includes:

- FASTA/genome indexing with Bowtie
- Generation of all 6–10 nucleotide sequence combinations
- Exact-match genome searching
- Parsing alignment positions
- Detection of tandem repeats with three or more adjacent copies
- Comparison of repeat patterns between genomes

### Project 2 — Protein-coding gene prediction

A small gene-prediction workflow operates directly on nucleotide sequence and evaluates candidate open reading frames.

Topics include:

- FASTA parsing
- Reverse complements
- Start/stop codons and ORF discovery
- ORF-length filtering
- GC content
- Codon-usage bias / coding potential
- Comparison with known human and mouse mitochondrial genes

### Project 3 — Sequence alignment with dynamic programming

An overlap-alignment algorithm is implemented from scratch using NumPy.

The project covers:

- Dynamic-programming scoring matrices
- Match, mismatch, and gap penalties
- Traceback
- Free terminal-gap variants for overlap alignment
- Producing and displaying the resulting aligned sequences

### Project 4 — Protein secondary-structure prediction

A supervised machine-learning predictor classifies each amino-acid residue as **helix, strand, or coil**.

The implementation includes:

- Protein families with known structures
- PDB-derived sequence and secondary-structure data
- Sliding-window residue features
- One-hot/binary amino-acid encoding
- BLOSUM62 feature encoding
- k-nearest-neighbor classification
- Cross-validation with scikit-learn
- Comparison of feature representations and model settings

## Repository structure

```text
bioinf/
├── bioinf_homework_1/
├── bioinf_homework_2/
├── bioinf_homework_3/
└── bioinf_homework_4/
```

Projects contain Python source and/or Jupyter Notebook exports together with supporting data and report material.

## Main tools

- Python
- Jupyter
- NumPy
- pandas
- scikit-learn
- matplotlib
- Bowtie
- FASTA / sequence data
- BLOSUM62

## Historical note

This is archived coursework. Several scripts contain historical local file paths or depend on older versions of Bowtie, NumPy, and other libraries, so some modernization may be required before rerunning them.

## Course source

University of Cincinnati Biomedical Informatics course description for **BMIN7099 — Introduction to Bioinformatics**:

https://med.uc.edu/docs/default-source/bmi-docs/biomedical-informatics-certificate-course-descriptions__fall-2020-docx.pdf?sfvrsn=e140df71_2
