# MPI Parallel Communication Example

This repository contains a Fortran program that demonstrates how to use MPI (Message Passing Interface) for parallel communication among processes. The program creates a matrix and distributes it among different processes, showcasing a basic example of parallel computing.

## What the Program Does

The provided Fortran code (`communicator.f90`) performs the following tasks:

1. Imports necessary modules and libraries.
2. Declares integer variables `n`, `i`, and `m` for matrix dimensions and counters.
3. Declares variables `erro`, `NpMpi`, and `IdMpi` for error handling, number of MPI processes, and process identifier.
4. Declares an allocatable matrix `a` of size `n` by `m`.
5. Initializes the MPI environment using `MPI_INIT`.
6. Retrieves the total number of MPI processes using `MPI_COMM_SIZE` and the current process identifier using `MPI_COMM_RANK`.
7. Allocates memory for matrix `a`.
8. If the process has identifier 0 (`IdMpi==0`):
   - Sets the values of the first row of matrix `a` as [1, 2, 3, 4].
   - Sets the values of the second row of matrix `a` as [5, 6, 7, 8].
   - Sets the values of the third row of matrix `a` as [9, 10, 11, 12].
9. For other processes:
   - Initializes all rows of matrix `a` with zeros.
10. Prints matrix `a` before communication.
11. Synchronizes all processes using `mpi_barrier` to ensure they all reach the same point before proceeding.
12. Performs a broadcast operation, transmitting the submatrix `a(1,1)` of size `n*n` from process 0 to all other processes using `mpi_bcast`.
13. Prints matrix `a` after communication.
14. Finalizes the MPI environment using `MPI_FINALIZE`.

## Usage

1. Make sure you have an MPI library installed on your system.
2. Compile the program using a Fortran compiler that supports MPI. For example:
