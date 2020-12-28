APP := vectorAdd
OUTDIR := ${PWD}

all: nsys ncu

nsys: ${OUTDIR}/${APP}.qdstrm
	@echo "Output files are in ${OUTDIR}"

ncu: ${OUTDIR}/${APP}.compute.ncu-rep
	@echo "Output files are in ${OUTDIR}"

${OUTDIR}/${APP}.compute.ncu-rep: ${OUTDIR}/${APP}
	jsrun -n1 -c1 -g1 -a1 --smpiargs="-disable_gpu_hooks" -- ncu --target-processes=all -c 1500 --set=full --force-overwrite -o ${OUTDIR}/${APP}.compute ${OUTDIR}/${APP} || exit 3

${OUTDIR}/${APP}.qdstrm: ${OUTDIR}/${APP}
	jsrun -n1 -c1 -g1 -a1 -- nsys profile -o ${OUTDIR}/${APP}.systems.qdrep -f true ${OUTDIR}/${APP} || exit 2

${OUTDIR}/${APP}: ${APP}.cu
	nvcc -o ${OUTDIR}/${APP} ${APP}.cu -lnvToolsExt || exit 1

clean:
	rm -f ${OUTDIR}/${APP} ${OUTDIR}/${APP}.systems.qdrep ${OUTDIR}/${APP}.compute.ncu-rep
