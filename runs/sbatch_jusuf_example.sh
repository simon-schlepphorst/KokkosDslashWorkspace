#!/bin/bash -x
#SBATCH --account=slnpp
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=256
#SBATCH --partition=batch

export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}
export OMP_PROC_BIND=spread
export OMP_PLACES=threads
srun --exclusive --cpu-bind=none ./../build/build_kokkos_dslash/test/test_kokkos_perf_fp
