APP := vectorAdd
OUTDIR := ${PWD}

nsys: ${OUTDIR}/${APP}.qdstrm
	@echo "Output files are in ${OUTDIR}"

${OUTDIR}/${APP}.qdstrm: ${OUTDIR}/${APP}
	jsrun -n1 -c1 -g1 -a1 -- nsys profile ${OUTDIR}/${APP} -o ${OUTDIR}/${APP}.qdstrm -f true || exit 2

${OUTDIR}/${APP}: ${APP}.cu
	nvcc -o ${OUTDIR}/${APP} ${APP}.cu -lnvToolsExt || exit 1

clean:
	rm -f ${OUTDIR}/${APP} ${OUTDIR}/${APP}.qdstrm
