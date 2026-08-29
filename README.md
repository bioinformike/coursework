# par_comp_work — CS6068 Parallel Computing

Coursework from **CS6068: Parallel Computing** at the **University of Cincinnati**.

Original repository: https://github.com/bioinformike/par_comp_work

## Course overview

CS6068 is a graduate computer-science course in parallel computing. University of Cincinnati course listings identify it as a three-credit CS graduate course, and archived UC parallel-computing material describes the course as an introduction to parallel-computing concepts, tools, programming techniques, and methods of performance analysis.

The surviving coursework here is highly practical. It moves from multicore CPU parallelism in Python to CUDA/GPU kernels, memory layout, image processing, tiling, reductions, histograms, and prefix scans. The repository also contains a small parallel bioinformatics utility.

## What this repository covers

### CPU multiprocessing

`Homework_1/mandelbrot_mp.py` computes and visualizes the Mandelbrot set in two ways:

- Serial execution
- Parallel execution using Python's `multiprocessing.Pool`
- Work distribution with `map`
- Timing and comparison of serial versus multicore execution

### CUDA fundamentals and image processing

CUDA homework implements GPU kernels for image operations such as:

- Mapping CUDA threads/blocks onto 2D images
- Flattening 2D coordinates into device-memory indices
- RGBA-to-grayscale conversion
- Separating image color channels
- Gaussian blur kernels
- Recombining channels
- Device-memory allocation and host-to-device copies
- Kernel synchronization and CUDA error checking

### Tiling and shared memory

A matrix-transpose exercise compares several implementations:

- CPU transpose
- Single-thread GPU transpose
- Parallel per-row transpose
- Per-element tiled transpose
- Tiled transpose using CUDA shared memory
- Timing and output verification

This demonstrates how memory access patterns, tiling, synchronization, and shared memory affect GPU performance.

### Parallel primitives

A later CUDA assignment works through core data-parallel building blocks:

- Parallel minimum/maximum reduction
- Histogram construction with atomic operations
- Shared-memory operations
- Prefix sum / scan
- Cumulative distribution calculation for image luminance

### parSnip

`parSnip` is a Python multiprocessing utility for trimming a supplied 3' adapter from FASTA or FASTQ sequence files.

It includes:

- FASTA/FASTQ parsing
- gzip-capable input/output
- Chunked work distribution
- `multiprocessing.Pool.apply_async`
- Adapter trimming
- Preservation of FASTQ quality strings
- Processing summaries

## Repository structure

```text
par_comp_work/
├── Homework_1/
├── Homework_4/
├── Homework_5/
├── Homework_6/
└── parSnip/
```

## Main tools

- Python
- `multiprocessing`
- NumPy
- matplotlib
- Biopython
- CUDA C/C++
- NVIDIA CUDA runtime
- GPU shared memory and synchronization primitives

## Historical note

This is archived coursework. The CUDA code reflects GPU/runtime assumptions and teaching frameworks used at the time, so block-size constraints, helper headers, compiler requirements, and deprecated APIs may need adjustment on current hardware.

## Course sources

University of Cincinnati EECS graduate handbook listing **CS6068 — Parallel Computing**:

https://ceas.uc.edu/content/dam/refresh/ceas-62/documents/handbooks/2023-2024/eecs-graduate-handbook-2023_24.pdf

Archived University of Cincinnati parallel-computing syllabus (earlier course numbering):

https://eecs.ceas.uc.edu/~annexsfs/Courses/cs668-2007/
