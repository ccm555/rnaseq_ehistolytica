for i in $(ls);
do
    echo $i
    date
done

echo "Alineamientos y procesamiento"

for i in  $(ls lecturas/*1P.fq)
do
    echo ${i/_1P.fq/}
    hisat2 -p 8 --dta -x $1 -1 $i -2 ${i/1P/2P} -S ${i/_1P.fq/.sam}
    samtools view -bS -T ${1}.fa ${i/_1P.fq/.sam} > ${i/_1P.fq/.bam}
    samtools sort ${i/_1P.fq/.bam} > ${i/_1P.fq/.sort.bam}
    rm ${i/_1P.fq/.sam} ${i/_1P.fq/.bam}
    samtools index ${i/_1P.fq/.sort.bam}
done

date
echo "Terminado"
