#! /apps/x86_64/nextflow/21.04.3 nextflow

//params.querydir = "$PWD/test_genomes/*.fasta"

// Change the filepath in Channel.fromPath() to read fasta files with a single sequence each
  myFileChannel = Channel.fromPath(params.querydir)

if (params.help) {
    helpMessage()
    exit 0
}

process runBlast {

  publishDir "/scicomp/home-pure/ydn3/nextflow_tutorial/blastOut/", mode: 'copy'
  
  input:
  file queries from myFileChannel
  
  output:
  file 'myBlast.tab' into intermediate
  file queries into nextIntermediate

  script:
  """
  module load ncbi-blast/2.10.0
  blastn  -num_threads $params.threads -db $params.dbDir/$params.dbName -query $queries -outfmt $params.outfmt $params.options -out myBlast.tab
  module unload ncbi-blast/2.10.0
  """
}

process showOutput {
        input:
        file 'myBlast.tab' from intermediate
	file queries from nextIntermediate

        output:
        stdout into result

        script:
        """
        module load Python/3.9.1
        /scicomp/home-pure/ydn3/nextflow_tutorial/fetchMedianTrim.py myBlast.tab $queries > view.txt
        cat view.txt
        module unload Python/3.9.1
        """
}


result.view { it.trim() }



def helpMessage() {
  log.info """
        Usage:
        The typical command for running the pipeline with an unmodified nextflow.config:
        nextflow run blastnCOVIDextract.nf

        The command for running the pipeline with custom query, blastDB directory, and blastDB name.
        nextflow run blastnCOVIDextract.nf --query QUERY.fasta --dbDir "blastDatabaseDirectory" --dbName "blastPrefixName"

       Optional arguments:
        --query                        Query fasta file of sequences you wish to BLAST
        --dbDir                        BLAST database directory (full path required)
        --dbName                       Prefix name of the BLAST database
        --outdir                       Output directory to place final BLAST output
        --outfmt                       Output format ['6']
        --options                      Additional options for BLAST command [-evalue 1e-3]
        --threads                      Number of CPUs to use during blast job [16]
        --help                         This usage statement.
        """
}
