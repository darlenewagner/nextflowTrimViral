# nextflowTrimViral
The typical command for running the pipeline with an unmodified nextflow.config:<br>
```nextflow run blastnCOVIDextract.nf```<br>
The command for running the pipeline with custom query, blastDB directory, and blastDB name.<br>
```nextflow run blastnCOVIDextract.nf --query QUERY.fasta --dbDir blastDatabaseDirectory --dbName blastPrefixName```<br>
Alternatively, instead of specifying a --query, edit the input folder name inside the Channel.fromPath('') function on line 4<br><br>
***Prerequisites***<br>
- Python 3.9.X or higher<br>
- Nextflow 21.X or higher<br>
- blast 2.10 or higher<br>
- a local blast-formatted nucleotide database<br>
        
