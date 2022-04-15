# nextflowTrimViral
The typical command for running the pipeline with an unmodified nextflow.config:<br>
```nextflow run blastnCOVIDextract.nf```<br><br>
The command for running the pipeline with custom query, blastDB directory, and blastDB name.<br>
```nextflow run blastnCOVIDextract.nf --query queryDirectory --dbDir blastDatabaseDirectory --dbName blastPrefixName```<br><br>
Alternatively, edit the input folder name for the ***query =*** statement on line 2 of nextflow.config<br><br>
***Prerequisites***<br>
- Python 3.9.X or higher<br>
- Nextflow 21.X or higher<br>
- blast 2.10 or higher<br>
- a local blast-formatted nucleotide database<br>
        
