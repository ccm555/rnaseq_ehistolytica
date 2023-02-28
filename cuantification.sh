
echo "Iniciando conteos con stringtie"

for i in $(ls *sort.bam)
do
    stringtie $i -p 8 -o ${i/sort.bam/gtf}
done

ls *.gtf > gtf_todos.txt

stringtie --merge -G $1 -o stringtie_merged.gtf gtf_todos.txt

mkdir ballgown

for i in $(ls *sort.bam); do
  stringtie -e -B -p 10 -G stringtie_merged.gtf -o ballgown/${i/.sort.bam}/transcripts.gtf $i;
done


