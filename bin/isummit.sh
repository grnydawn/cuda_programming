#!/usr/bin/bash

if [ "$#" -ne 1 ]; then
    echo "ERROR: charging account is missing"
else
	bsub -Is -W 2:00 -nnodes 1 -P $1 $SHELL
fi


#$ hostname
#batch2
#
#$ jsrun -n1 hostname
#a35n03

# module commands
#module load pgi
#module load cuda
#module load nsight-systems
#module load nsight-compute
