#! /apps/x86_64/nextflow/21.04.3 nextflow

nextflow.enable.dsl=2

// How to run:
// nextflow run nextflowTrimViral/mergeSepFastaToMultifasta.nf --querydir "nextflowTrimViral/tentativeOutput/genomeID/*.fasta" --id "genomeID" --folderPath "Genomes/genomeID_assembly/"
//
 myOutput = params.folderPath
 myString = params.id

process mergeFasta {

    publishDir "$PWD/$myOutput/", mode: 'copy'

    input:
    path x
    
    script:
    """
    cat ${x.getBaseName()}.fasta >> "$PWD/${myOutput}/${myString}.fasta"
    """

 }

workflow {

Channel.fromPath(params.querydir, glob: true) | mergeFasta

//| collectFile | view 
 
}