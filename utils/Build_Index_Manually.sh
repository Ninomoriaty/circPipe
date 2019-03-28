#!/usr/bin/sh
# this script were made for build index in your server as input reference of circPipe. 
# To note , the index building step will take hours and a large amount of resources of your server. You can run the commmand below and have a sleep.(Except building the KNIFE index)  Then start your analysis trip with circPipe



if [[ $# -eq 0 ]] ; then
    echo 'Usage:\t\tsh Build_index_Manually.sh <genome.fa> <genome.gtf> <basename>'
    echo '\t\t<genome.fa> is your genome sequence in fasta format'
    echo '\t\t<genome.gtf> is the GTF file of your genome sequence'
    echo '\t\t<basename> is your index name. e.g. hg19'
    exit 0
fi

GENOME_FASTA=$1
GENOME_GTF=$2
EXON_GTF=$3
path_to_circularRNApipeline=$4
transcriptome=$5
ribosomal=$6



#### Build STAR INDEX 
#### Parameters : --runThreadN means the cpu numbers , --sjdbGTFfile is the GTF Formatted annotation file , --genomeDir is the path you create for index , --genomeFastaFiles is the FASTA Formatted genome file .
#### The example commandline shows below :
STAR --runMode genomeGenerate --runThreadN 8 --sjdbGTFfile ${GENOME_GTF} --genomeDir starindex/ --genomeFastaFiles ${GENOME_FASTA} --sjdbOverhang 149

#### Build BOWTIE2 INDEX
#### Parameters : ${GENOME_FASTA} is the FASTA Formatted genome file , genome is the prefix name of the index.
bowtie2-build -f ${GENOME_FASTA} genome

#### Build BOWTIE INDEX
#### Parameters : ${GENOME_FASTA} is the FASTA Formatted genome file , genome is the prefix name of the index.
bowtie-build ${GENOME_FASTA} genome

#### Build BWA INDEX
#### Parameters : index '${GENOME_FASTA}' is the FASTA Formatted genome file , -p genome is the prefix name of the index.

bwa index ${GENOME_FASTA} -p genome

#### Build SEGEMEHL INDEX
#### Parameters : -d '${GENOME_FASTA}' is the FASTA Formatted genome file , -x 'genome.idx' is the whole name of the index.
segemehl.x -d ${GENOME_FASTA} -x genome.idx


####Build KNIFE INDEX
####Please follow the proceduces below manually , or you can take a look at https://github.com/lindaszabo/KNIFE/tree/master/createJunctionIndex

#either find or create a bowtie2 transcriptome index that was created with the same gtf and genome build you are using

bowtie2-build -f ${transcriptome} genome

#create a bowtie2 ribosomal RNA index using the ribosomal fasta file

bowtie2-build -f ${ribosomal} genome

#COMMAND 1: creates the exon database. This is independent of window size, so if you decide to change the window size you do not need to repeat this step.

python makeExonDB.py -f ${GENOME_FASTA} -a ${EXON_GTF} -o ./exondatabase

#parameters

#-f: ${GENOME_FASTA} file for the species

#-a: ${EXON_GTF} file for the species with exon annotations to be used for the index

#-o: directory to output the database files

#COMMAND 2: creates the junction indices. This can only be run after COMMAND 1 is complete.

sh createJunctionIndex.sh ${path_to_circularRNApipeline} ./exondatabase genome 1000000

#parameters

#path_to_circularRNApipeline: path to the pipeline directory, index files created will be placed in the index subdirectory

