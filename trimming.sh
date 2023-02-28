for i in $(ls *R1_*.fastq.gz)
do
    trimmomatic PE \
    ${i} ${i/R1/R2} \
    ${i/R1_001.fastq.gz/1P.fq} ${i/R1_001.fastq.gz/1U.fq} ${i/R1_001.fastq.gz/2P.fq} ${i/R1_001.fastq.gz/2U.fq} \
    ILLUMINACLIP:${1}:2:30:10 SLIDINGWINDOW:5:25 MINLEN:50
done
