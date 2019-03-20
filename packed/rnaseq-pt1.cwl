{
    "cwlVersion": "v1.0", 
    "$schemas": [
        "https://schema.org/docs/schema_org_rdfa.html", 
        "http://schema.org/docs/schema_org_rdfa.html"
    ], 
    "$graph": [
        {
            "class": "CommandLineTool", 
            "requirements": [
                {
                    "class": "EnvVarRequirement", 
                    "envDef": [
                        {
                            "envName": "PATH", 
                            "envValue": "/usr/local/bin/:/usr/bin:/bin"
                        }
                    ], 
                    "id": "#envvar-global.yml", 
                    "name": "#envvar-global.yml"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "hints": [
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "scidap/star:v2.5.0b", 
                    "dockerFile": "$import: STAR-Dockerfile\n"
                }
            ], 
            "inputs": [
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignEndsType"
                    }, 
                    "doc": "Local\nstring: type of read ends alignment\nLocal           ... standard local alignment with soft-clipping allowed\nEndToEnd        ... force end-to-end read alignment, do not soft-clip\nExtend5pOfRead1 ... fully extend only the 5p of the read1, all other ends: local alignment\n", 
                    "id": "#STAR.cwl/alignEndsType"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignIntronMax"
                    }, 
                    "doc": "0\nmaximum intron size, if 0, max intron size will be determined by (2^winBinNbits)*winAnchorDistNbins\n", 
                    "id": "#STAR.cwl/alignIntronMax"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignIntronMin"
                    }, 
                    "doc": "21\nminimum intron size: genomic gap is considered intron if its length>=alignIntronMin, otherwise it is considered Deletion\n", 
                    "id": "#STAR.cwl/alignIntronMin"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignMatesGapMax"
                    }, 
                    "doc": "0\nmaximum gap between two mates, if 0, max intron gap will be determined by (2^winBinNbits)*winAnchorDistNbins\n", 
                    "id": "#STAR.cwl/alignMatesGapMax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignSJDBoverhangMin"
                    }, 
                    "doc": "3\nint>0: minimum overhang (i.e. block size) for annotated (sjdb) spliced alignments\n", 
                    "id": "#STAR.cwl/alignSJDBoverhangMin"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignSJoverhangMin"
                    }, 
                    "doc": "5\nint>0: minimum overhang (i.e. block size) for spliced alignments\n", 
                    "id": "#STAR.cwl/alignSJoverhangMin"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignSJstitchMismatchNmax"
                    }, 
                    "doc": "0 -1 0 0\n4*int>=0: maximum number of mismatches for stitching of the splice junctions (-1: no limit).\n(1) non-canonical motifs, (2) GT/AG and CT/AC motif, (3) GC/AG and CT/GC motif, (4) AT/AC and GT/AT motif.\n", 
                    "id": "#STAR.cwl/alignSJstitchMismatchNmax"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignSoftClipAtReferenceEnds"
                    }, 
                    "doc": "Yes\nstring: allow the soft-clipping of the alignments past the end of the chromosomes\nYes ... allow\nNo  ... prohibit, useful for compatibility with Cufflinks\n", 
                    "id": "#STAR.cwl/alignSoftClipAtReferenceEnds"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignSplicedMateMapLmin"
                    }, 
                    "doc": "0\nint>0: minimum mapped length for a read mate that is spliced\n", 
                    "id": "#STAR.cwl/alignSplicedMateMapLmin"
                }, 
                {
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignSplicedMateMapLminOverLmate"
                    }, 
                    "doc": "0.66\nfloat>0: alignSplicedMateMapLmin normalized to mate length\n", 
                    "id": "#STAR.cwl/alignSplicedMateMapLminOverLmate"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignTranscriptsPerReadNmax"
                    }, 
                    "doc": "10000\nint>0: max number of different alignments per read to consider\n", 
                    "id": "#STAR.cwl/alignTranscriptsPerReadNmax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignTranscriptsPerWindowNmax"
                    }, 
                    "doc": "100\nint>0: max number of transcripts per window\n", 
                    "id": "#STAR.cwl/alignTranscriptsPerWindowNmax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignWindowsPerReadNmax"
                    }, 
                    "doc": "10000\nint>0: max number of windows per read\n", 
                    "id": "#STAR.cwl/alignWindowsPerReadNmax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--bamRemoveDuplicatesMate2basesN"
                    }, 
                    "doc": "int>0: number of bases from the 5' of mate 2 to use in collapsing (e.g. for\nRAMPAGE)\n", 
                    "id": "#STAR.cwl/bamRemoveDuplicatesMate2basesN"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--bamRemoveDuplicatesType"
                    }, 
                    "doc": "-\nstring: mark duplicates in the BAM file, for now only works with sorted BAM feeded with inputBAMfile\n-               ... no duplicate removal/marking\nUniqueIdentical ... mark all multimappers, and duplicate unique mappers. The coordinates, FLAG, CIGAR must be identical\n", 
                    "id": "#STAR.cwl/bamRemoveDuplicatesType"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimFilter"
                    }, 
                    "doc": "banGenomicN\nstring(s): different filters for chimeric alignments\nNone ... no filtering\nbanGenomicN ... Ns are not allowed in the genome sequence around the chimeric junction\n", 
                    "id": "#STAR.cwl/chimFilter"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimJunctionOverhangMin"
                    }, 
                    "doc": "20\nint>=0: minimum overhang for a chimeric junction\n", 
                    "id": "#STAR.cwl/chimJunctionOverhangMin"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimOutType"
                    }, 
                    "doc": "SeparateSAMold\nstring: type of chimeric output\nSeparateSAMold  ... output old SAM into separate Chimeric.out.sam file\nWithinBAM       ... output into main aligned BAM files (Aligned.*.bam)\n", 
                    "id": "#STAR.cwl/chimOutType"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimScoreDropMax"
                    }, 
                    "doc": "20\nint>=0: max drop (difference) of chimeric score (the sum of scores of all chimeric segements) from the read length\n", 
                    "id": "#STAR.cwl/chimScoreDropMax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimScoreJunctionNonGTAG"
                    }, 
                    "doc": "-1\nint: penalty for a non-GT/AG chimeric junction\n", 
                    "id": "#STAR.cwl/chimScoreJunctionNonGTAG"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimScoreMin"
                    }, 
                    "doc": "0\nint>=0: minimum total (summed) score of the chimeric segments\n", 
                    "id": "#STAR.cwl/chimScoreMin"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimScoreSeparation"
                    }, 
                    "doc": "int>=0: minimum difference (separation) between the best chimeric score and\nthe next one\n", 
                    "id": "#STAR.cwl/chimScoreSeparation"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimSegmentMin"
                    }, 
                    "doc": "0\nint>=0: minimum length of chimeric segment length, if ==0, no chimeric output\n", 
                    "id": "#STAR.cwl/chimSegmentMin"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimSegmentReadGapMax"
                    }, 
                    "doc": "0\nint>=0: maximum gap in the read sequence between chimeric segments\n", 
                    "id": "#STAR.cwl/chimSegmentReadGapMax"
                }, 
                {
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--clip3pAdapterMMp"
                    }, 
                    "doc": "double(s): max proportion of mismatches for 3p adpater clipping for each\nmate.  If one value is given, it will be assumed the same for both mates.\n", 
                    "id": "#STAR.cwl/clip3pAdapterMMp"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--clip3pAdapterSeq"
                    }, 
                    "doc": "string(s): adapter sequences to clip from 3p of each mate.  If one value is\ngiven, it will be assumed the same for both mates.\n", 
                    "id": "#STAR.cwl/clip3pAdapterSeq"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--clip3pAfterAdapterNbases"
                    }, 
                    "doc": "int(s): number of bases to clip from 3p of each mate after the adapter\nclipping. If one value is given, it will be assumed the same for both\nmates.\n", 
                    "id": "#STAR.cwl/clip3pAfterAdapterNbases"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--clip3pNbases"
                    }, 
                    "doc": "int(s): number(s) of bases to clip from 3p of each mate. If one value is\ngiven, it will be assumed the same for both mates.\n", 
                    "id": "#STAR.cwl/clip3pNbases"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--clip5pNbases"
                    }, 
                    "doc": "int(s): number(s) of bases to clip from 5p of each mate. If one value is\ngiven, it will be assumed the same for both mates.\n", 
                    "id": "#STAR.cwl/clip5pNbases"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--genomeChrBinNbits"
                    }, 
                    "doc": "int: =log2(chrBin), where chrBin is the size of the bins for genome\nstorage: each chromosome will occupy an integer number of bins\n", 
                    "id": "#STAR.cwl/genomeChrBinNbits"
                }, 
                {
                    "type": "Directory", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--genomeDir"
                    }, 
                    "doc": "string: path to the directory where genome files are stored (if\nrunMode!=generateGenome) or will be generated (if runMode==generateGenome)\n", 
                    "id": "#STAR.cwl/genomeDir"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "itemSeparator": " ", 
                        "prefix": "--genomeFastaFiles"
                    }, 
                    "doc": "string(s): path(s) to the fasta files with genomic sequences for genome\ngeneration, separated by spaces. Only used if runMode==genomeGenerate.\nThese files should be plain text FASTA files, they *cannot* be zipped.\n", 
                    "id": "#STAR.cwl/genomeFastaFiles"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--genomeLoad"
                    }, 
                    "doc": "NoSharedMemory\nstring: mode of shared memory usage for the genome files\nLoadAndKeep     ... load genome into shared and keep it in memory after run\nLoadAndRemove   ... load genome into shared but remove it after run\nLoadAndExit     ... load genome into shared memory and exit, keeping the genome in memory for future runs\nRemove          ... do not map anything, just remove loaded genome from memory\nNoSharedMemory  ... do not use shared memory, each job will have its own private copy of the genome\n", 
                    "id": "#STAR.cwl/genomeLoad"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--genomeSAindexNbases"
                    }, 
                    "doc": "int: length (bases) of the SA pre-indexing string. Typically between 10 and\n15. Longer strings will use much more memory, but allow faster searches.\n", 
                    "id": "#STAR.cwl/genomeSAindexNbases"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--genomeSAsparseD"
                    }, 
                    "doc": "int>0: suffux array sparsity, i.e. distance between indices: use bigger\nnumbers to decrease needed RAM at the cost of mapping speed reduction\n", 
                    "id": "#STAR.cwl/genomeSAsparseD"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--inputBAMfile"
                    }, 
                    "doc": "string: path to BAM input file, to be used with --runMode\ninputAlignmentsFromBAM\n", 
                    "id": "#STAR.cwl/inputBAMfile"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitBAMsortRAM"
                    }, 
                    "doc": "int>=0: maximum available RAM for sorting BAM. If =0, it will be set to the\ngenome index size. 0 value can only be used with --genomeLoad\nNoSharedMemory option.\n", 
                    "id": "#STAR.cwl/limitBAMsortRAM"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitGenomeGenerateRAM"
                    }, 
                    "doc": "31000000000\nint>0: maximum available RAM (bytes) for genome generation\n", 
                    "id": "#STAR.cwl/limitGenomeGenerateRAM"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitIObufferSize"
                    }, 
                    "doc": "150000000\nint>0: max available buffers size (bytes) for input/output, per thread\n", 
                    "id": "#STAR.cwl/limitIObufferSize"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitOutSAMoneReadBytes"
                    }, 
                    "doc": "100000\nint>0: max size of the SAM record for one read. Recommended value: >(2*(LengthMate1+LengthMate2+100)*outFilterMultimapNmax\n", 
                    "id": "#STAR.cwl/limitOutSAMoneReadBytes"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitOutSJcollapsed"
                    }, 
                    "doc": "1000000\nint>0: max number of collapsed junctions\n", 
                    "id": "#STAR.cwl/limitOutSJcollapsed"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitOutSJoneRead"
                    }, 
                    "doc": "1000\nint>0: max number of junctions for one read (including all multi-mappers)\n", 
                    "id": "#STAR.cwl/limitOutSJoneRead"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitSjdbInsertNsj"
                    }, 
                    "doc": "1000000\nint>=0: maximum number of junction to be inserted to the genome on the fly at the mapping stage, including those from annotations and those detected in the 1st step of the 2-pass run\n", 
                    "id": "#STAR.cwl/limitSjdbInsertNsj"
                }, 
                {
                    "type": "int", 
                    "default": 10, 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outBAMcompression"
                    }, 
                    "doc": "int: -1 to 10  BAM compression level, -1=default compression (6?), 0=no\ncompression, 10=maximum compression\n", 
                    "id": "#STAR.cwl/outBAMcompression"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outBAMsortingThreadN"
                    }, 
                    "doc": "int: >=0: number of threads for BAM sorting. 0 will default to\nmin(6,--runThreadN).\n", 
                    "id": "#STAR.cwl/outBAMsortingThreadN"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFileNamePrefix"
                    }, 
                    "doc": "string: output files name prefix (including full or relative path). Can\nonly be defined on the command line.\n", 
                    "id": "#STAR.cwl/outFileNamePrefix"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterIntronMotifs"
                    }, 
                    "doc": "None\nstring: filter alignment using their motifs\nNone                           ... no filtering\nRemoveNoncanonical             ... filter out alignments that contain non-canonical junctions\nRemoveNoncanonicalUnannotated  ... filter out alignments that contain non-canonical unannotated junctions when using annotated splice junctions database. The annotated non-canonical junctions will be kept.\n", 
                    "id": "#STAR.cwl/outFilterIntronMotifs"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMatchNmin"
                    }, 
                    "doc": "0\nint: alignment will be output only if the number of matched bases is higher than this value\n", 
                    "id": "#STAR.cwl/outFilterMatchNmin"
                }, 
                {
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMatchNminOverLread"
                    }, 
                    "doc": "0.66\nfloat: outFilterMatchNmin normalized to read length (sum of mates' lengths for paired-end reads)\n", 
                    "id": "#STAR.cwl/outFilterMatchNminOverLread"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMismatchNmax"
                    }, 
                    "doc": "10\nint: alignment will be output only if it has fewer mismatches than this value\n", 
                    "id": "#STAR.cwl/outFilterMismatchNmax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMismatchNoverLmax"
                    }, 
                    "doc": "0.3\nint: alignment will be output only if its ratio of mismatches to *mapped* length is less than this value\n", 
                    "id": "#STAR.cwl/outFilterMismatchNoverLmax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMismatchNoverReadLmax"
                    }, 
                    "doc": "1\nint: alignment will be output only if its ratio of mismatches to *read* length is less than this value\n", 
                    "id": "#STAR.cwl/outFilterMismatchNoverReadLmax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMultimapNmax"
                    }, 
                    "doc": "10\nint: read alignments will be output only if the read maps fewer than this value, otherwise no alignments will be output\n", 
                    "id": "#STAR.cwl/outFilterMultimapNmax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMultimapScoreRange"
                    }, 
                    "doc": "1\nint: the score range below the maximum score for multimapping alignments\n", 
                    "id": "#STAR.cwl/outFilterMultimapScoreRange"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterScoreMin"
                    }, 
                    "doc": "0\nint: alignment will be output only if its score is higher than this value\n", 
                    "id": "#STAR.cwl/outFilterScoreMin"
                }, 
                {
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterScoreMinOverLread"
                    }, 
                    "doc": "0.66\nfloat: outFilterScoreMin normalized to read length (sum of mates' lengths for paired-end reads)\n", 
                    "id": "#STAR.cwl/outFilterScoreMinOverLread"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterType"
                    }, 
                    "doc": "Normal\nstring: type of filtering\nNormal  ... standard filtering using only current alignment\nBySJout ... keep only those reads that contain junctions that passed filtering into SJ.out.tab\n", 
                    "id": "#STAR.cwl/outFilterType"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outMultimapperOrder"
                    }, 
                    "doc": "Old_2.4\nstring: order of multimapping alignments in the output files\nOld_2.4             ... quasi-random order used before 2.5.0\nRandom              ... random order of alignments for each multi-mapper. Read mates (pairs) are always adjacent, all alignment for each read stay together. This option will become default in the future releases.\n", 
                    "id": "#STAR.cwl/outMultimapperOrder"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outQSconversionAdd"
                    }, 
                    "doc": "int: add this number to the quality score (e.g. to convert from Illumina to Sanger, use -31)\n", 
                    "id": "#STAR.cwl/outQSconversionAdd"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outReadsUnmapped"
                    }, 
                    "doc": "None\nstring: output of unmapped reads (besides SAM)\nNone    ... no output\nFastx   ... output in separate fasta/fastq files, Unmapped.out.mate1/2\n", 
                    "id": "#STAR.cwl/outReadsUnmapped"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMattrIHstart"
                    }, 
                    "doc": "1\nint>=0:                     start value for the IH attribute. 0 may be required by some downstream software, such as Cufflinks or StringTie.\n", 
                    "id": "#STAR.cwl/outSAMattrIHstart"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMattrRGline"
                    }, 
                    "doc": "-\nstring(s): SAM/BAM read group line. The first word contains the read group identifier and must start with \"ID:\", e.g. --outSAMattrRGline ID:xxx CN:yy \"DS:z z z\".\nxxx will be added as RG tag to each output alignment. Any spaces in the tag values have to be double quoted.\nComma separated RG lines correspons to different (comma separated) input files in --readFilesIn. Commas have to be surrounded by spaces, e.g.\n--outSAMattrRGline ID:xxx , ID:zzz \"DS:z z\" , ID:yyy DS:yyyy\n", 
                    "id": "#STAR.cwl/outSAMattrRGline"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMattributes"
                    }, 
                    "doc": "Standard\nstring: a string of desired SAM attributes, in the order desired for the output SAM\nNH HI AS nM NM MD jM jI XS ... any combination in any order\nStandard   ... NH HI AS nM\nAll        ... NH HI AS nM NM MD jM jI\nNone       ... no attributes\n", 
                    "id": "#STAR.cwl/outSAMattributes"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMfilter"
                    }, 
                    "doc": "None\nstring(s): filter the output into main SAM/BAM files\nKeepOnlyAddedReferences ... only keep the reads for which all alignments are to the extra reference sequences added with --genomeFastaFiles at the mapping stage.\n", 
                    "id": "#STAR.cwl/outSAMfilter"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMflagAND"
                    }, 
                    "doc": "65535\nint: 0 to 65535: sam FLAG will be bitwise AND'd with this value, i.e. FLAG=FLAG & outSAMflagOR. This is applied after all flags have been set by STAR, but before outSAMflagOR. Can be used to unset specific bits that are not set otherwise.\n", 
                    "id": "#STAR.cwl/outSAMflagAND"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMflagOR"
                    }, 
                    "doc": "int: 0 to 65535: sam FLAG will be bitwise OR'd with this value, i.e.\nFLAG=FLAG | outSAMflagOR. This is applied after all flags have been set by\nSTAR, and after outSAMflagAND. Can be used to set specific bits that are\nnot set otherwise.\n", 
                    "id": "#STAR.cwl/outSAMflagOR"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMheaderCommentFile"
                    }, 
                    "doc": "-\nstring: path to the file with @CO (comment) lines of the SAM header\n", 
                    "id": "#STAR.cwl/outSAMheaderCommentFile"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMheaderHD"
                    }, 
                    "doc": "-\nstrings: @HD (header) line of the SAM header\n", 
                    "id": "#STAR.cwl/outSAMheaderHD"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMheaderPG"
                    }, 
                    "doc": "-\nstrings: extra @PG (software) line of the SAM header (in addition to STAR)\n", 
                    "id": "#STAR.cwl/outSAMheaderPG"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMmapqUnique"
                    }, 
                    "doc": "255\nint: 0 to 255: the MAPQ value for unique mappers\n", 
                    "id": "#STAR.cwl/outSAMmapqUnique"
                }, 
                {
                    "type": "string", 
                    "default": "Full", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMmode"
                    }, 
                    "doc": "string: mode of SAM output\nNone ... no SAM output\nFull ... full SAM output\nNoQS ... full SAM but without quality scores\n", 
                    "id": "#STAR.cwl/outSAMmode"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMmultNmax"
                    }, 
                    "doc": "-1\nint: max number of multiple alignments for a read that will be output to the SAM/BAM files. -1 ... all alignments (up to --outFilterMultimapNmax) will be output\n", 
                    "id": "#STAR.cwl/outSAMmultNmax"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMorder"
                    }, 
                    "doc": "Paired\nstring: type of sorting for the SAM output\nPaired: one mate after the other for all paired alignments\nPairedKeepInputOrder: one mate after the other for all paired alignments, the order is kept the same as in the input FASTQ files\n", 
                    "id": "#STAR.cwl/outSAMorder"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMprimaryFlag"
                    }, 
                    "doc": "OneBestScore\nstring: which alignments are considered primary - all others will be marked with 0x100 bit in the FLAG\nOneBestScore ... only one alignment with the best score is primary\nAllBestScore ... all alignments with the best score are primary\n", 
                    "id": "#STAR.cwl/outSAMprimaryFlag"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMreadID"
                    }, 
                    "doc": "Standard\nstring: read ID record type\nStandard ... first word (until space) from the FASTx read ID line, removing /1,/2 from the end\nNumber   ... read number (index) in the FASTx file\n", 
                    "id": "#STAR.cwl/outSAMreadID"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMstrandField"
                    }, 
                    "doc": "None\nstring: Cufflinks-like strand field flag\nNone        ... not used\nintronMotif ... strand derived from the intron motif. Reads with inconsistent and/or non-canonical introns are filtered out.\n", 
                    "id": "#STAR.cwl/outSAMstrandField"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "string"
                    }, 
                    "default": [
                        "BAM", 
                        "SortedByCoordinate"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMtype"
                    }, 
                    "doc": "strings: type of SAM/BAM output\n1st word:\nBAM  ... output BAM without sorting\nSAM  ... output SAM without sorting\nNone ... no SAM/BAM output\n2nd, 3rd:\nUnsorted           ... standard unsorted\nSortedByCoordinate ... sorted by coordinate. This option will allocate extra memory for sorting which can be specified by --limitBAMsortRAM.\n", 
                    "id": "#STAR.cwl/outSAMtype"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMunmapped"
                    }, 
                    "doc": "string: output of unmapped reads in the SAM format\nNone   ... no output\nWithin ... output unmapped reads within the main SAM file (i.e. Aligned.out.sam)\n", 
                    "id": "#STAR.cwl/outSAMunmapped"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSJfilterCountTotalMin"
                    }, 
                    "doc": "3   1   1   1 \n4 integers: minimum total (multi-mapping+unique) read count per junction for: (1) non-canonical motifs, (2) GT/AG and CT/AC motif, (3) GC/AG and CT/GC motif, (4) AT/AC and GT/AT motif. -1 means no output for that motif\nJunctions are output if one of outSJfilterCountUniqueMin OR outSJfilterCountTotalMin conditions are satisfied\ndoes not apply to annotated junctions\n", 
                    "id": "#STAR.cwl/outSJfilterCountTotalMin"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSJfilterCountUniqueMin"
                    }, 
                    "doc": "3   1   1   1 \n4 integers: minimum uniquely mapping read count per junction for: (1) non-canonical motifs, (2) GT/AG and CT/AC motif, (3) GC/AG and CT/GC motif, (4) AT/AC and GT/AT motif. -1 means no output for that motif\nJunctions are output if one of outSJfilterCountUniqueMin OR outSJfilterCountTotalMin conditions are satisfied\ndoes not apply to annotated junctions\n", 
                    "id": "#STAR.cwl/outSJfilterCountUniqueMin"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSJfilterDistToOtherSJmin"
                    }, 
                    "doc": "10  0   5   10\n4 integers>=0: minimum allowed distance to other junctions' donor/acceptor\ndoes not apply to annotated junctions\n", 
                    "id": "#STAR.cwl/outSJfilterDistToOtherSJmin"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSJfilterIntronMaxVsReadN"
                    }, 
                    "doc": "50000 100000 200000\nN integers>=0: maximum gap allowed for junctions supported by 1,2,3,,,N reads\ni.e. by default junctions supported by 1 read can have gaps <=50000b, by 2 reads: <=100000b, by 3 reads: <=200000. by >=4 reads any gap <=alignIntronMax\ndoes not apply to annotated junctions\n", 
                    "id": "#STAR.cwl/outSJfilterIntronMaxVsReadN"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSJfilterOverhangMin"
                    }, 
                    "doc": "30  12  12  12\n4 integers:    minimum overhang length for splice junctions on both sides for: (1) non-canonical motifs, (2) GT/AG and CT/AC motif, (3) GC/AG and CT/GC motif, (4) AT/AC and GT/AT motif. -1 means no output for that motif\ndoes not apply to annotated junctions\n", 
                    "id": "#STAR.cwl/outSJfilterOverhangMin"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSJfilterReads"
                    }, 
                    "doc": "All\nstring: which reads to consider for collapsed splice junctions output\nAll: all reads, unique- and multi-mappers\nUnique: uniquely mapping reads only\n", 
                    "id": "#STAR.cwl/outSJfilterReads"
                }, 
                {
                    "type": "string", 
                    "default": "Log", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outStd"
                    }, 
                    "doc": "Log\nstring: which output will be directed to stdout (standard out)\nLog                    ... log messages\nSAM                    ... alignments in SAM format (which normally are output to Aligned.out.sam file), normal standard output will go into Log.std.out\nBAM_Unsorted           ... alignments in BAM format, unsorted. Requires --outSAMtype BAM Unsorted\nBAM_SortedByCoordinate ... alignments in BAM format, unsorted. Requires --outSAMtype BAM SortedByCoordinate\nBAM_Quant              ... alignments to transcriptome in BAM format, unsorted. Requires --quantMode TranscriptomeSAM\n", 
                    "id": "#STAR.cwl/outStd"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outTmpDir"
                    }, 
                    "doc": "string: path to a directory that will be used as temporary by STAR. All contents of this directory will be removed!\n- the temp directory will default to outFileNamePrefix_STARtmp\n", 
                    "id": "#STAR.cwl/outTmpDir"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outWigNorm"
                    }, 
                    "doc": "RPM\nstring: type of normalization for the signal\nRPM    ... reads per million of mapped reads\nNone   ... no normalization, \"raw\" counts\n", 
                    "id": "#STAR.cwl/outWigNorm"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outWigReferencesPrefix"
                    }, 
                    "doc": "string: prefix matching reference names to include in the output wiggle\nfile, e.g. \"chr\", default \"-\" - include all references\n", 
                    "id": "#STAR.cwl/outWigReferencesPrefix"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outWigStrand"
                    }, 
                    "doc": "Stranded\nstring: strandedness of wiggle/bedGraph output\nStranded   ...  separate strands, str1 and str2\nUnstranded ...  collapsed strands\n", 
                    "id": "#STAR.cwl/outWigStrand"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outWigType"
                    }, 
                    "doc": "None\nstring(s): type of signal output, e.g. \"bedGraph\" OR \"bedGraph read1_5p\". Requires sorted BAM: --outSAMtype BAM SortedByCoordinate .\n1st word:\nNone       ... no signal output\nbedGraph   ... bedGraph format\nwiggle     ... wiggle format\n2nd word:\nread1_5p   ... signal from only 5' of the 1st read, useful for CAGE/RAMPAGE etc\nread2      ... signal from only 2nd read\n", 
                    "id": "#STAR.cwl/outWigType"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--parametersFiles"
                    }, 
                    "doc": "string: name of a user-defined parameters file, \"-\": none. Can only be\ndefined on the command line.\n", 
                    "id": "#STAR.cwl/parametersFiles"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--quantMode"
                    }, 
                    "doc": "-\nstring(s): types of quantification requested\n-                ... none\nTranscriptomeSAM ... output SAM/BAM alignments to transcriptome into a separate file\nGeneCounts       ... count reads per gene\n", 
                    "id": "#STAR.cwl/quantMode"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--quantTranscriptomeBAMcompression"
                    }, 
                    "doc": "int: -1 to 10  transcriptome BAM compression level, -1=default compression\n(6?), 0=no compression, 10=maximum compression\n", 
                    "id": "#STAR.cwl/quantTranscriptomeBAMcompression"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--quantTranscriptomeBan"
                    }, 
                    "doc": "IndelSoftclipSingleend\nstring: prohibit various alignment type\nIndelSoftclipSingleend  ... prohibit indels, soft clipping and single-end alignments - compatible with RSEM\nSingleend               ... prohibit single-end alignments\n", 
                    "id": "#STAR.cwl/quantTranscriptomeBan"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--readFilesCommand"
                    }, 
                    "doc": "string(s): command line to execute for each of the input file. This command should generate FASTA or FASTQ text and send it to stdout\nFor example: zcat - to uncompress .gz files, bzcat - to uncompress .bz2 files, etc.\n", 
                    "id": "#STAR.cwl/readFilesCommand"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--readFilesIn"
                    }, 
                    "doc": "string(s): paths to files that contain input read1 (and, if needed,  read2)\n", 
                    "id": "#STAR.cwl/readFilesIn"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--readMapNumber"
                    }, 
                    "doc": "-1\nint: number of reads to map from the beginning of the file\n-1: map all reads\n", 
                    "id": "#STAR.cwl/readMapNumber"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--readMatesLengthsIn"
                    }, 
                    "doc": "string: Equal/NotEqual - lengths of names,sequences,qualities for both\nmates are the same  / not the same. NotEqual is safe in all situations.\n", 
                    "id": "#STAR.cwl/readMatesLengthsIn"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--readNameSeparator"
                    }, 
                    "doc": "/\nstring(s): character(s) separating the part of the read names that will be\ntrimmed in output (read name after space is always trimmed)\n", 
                    "id": "#STAR.cwl/readNameSeparator"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--runDirPerm"
                    }, 
                    "doc": "User_RWX\nstring: permissions for the directories created at the run-time.\nUser_RWX ... user-read/write/execute\nAll_RWX  ... all-read/write/execute (same as chmod 777)\n", 
                    "id": "#STAR.cwl/runDirPerm"
                }, 
                {
                    "type": "string", 
                    "default": "alignReads", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--runMode"
                    }, 
                    "doc": "string: type of the run:\nalignReads             ... map reads\ngenomeGenerate         ... generate genome files\ninputAlignmentsFromBAM ... input alignments from BAM. Presently only works with --outWigType and --bamRemoveDuplicates.\n", 
                    "id": "#STAR.cwl/runMode"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--runRNGseed"
                    }, 
                    "doc": "777\nint: random number generator seed.\n", 
                    "id": "#STAR.cwl/runRNGseed"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--runThreadN"
                    }, 
                    "doc": "1\nint: number of threads to run STAR\n", 
                    "id": "#STAR.cwl/runThreadN"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreDelBase"
                    }, 
                    "doc": "-2\ndeletion extension penalty per base (in addition to scoreDelOpen)\n", 
                    "id": "#STAR.cwl/scoreDelBase"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreDelOpen"
                    }, 
                    "doc": "-2\ndeletion open penalty\n", 
                    "id": "#STAR.cwl/scoreDelOpen"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreGap"
                    }, 
                    "doc": "0\nint: splice junction penalty (independent on intron motif)\n", 
                    "id": "#STAR.cwl/scoreGap"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreGapATAC"
                    }, 
                    "doc": "-8\nAT/AC  and GT/AT junction penalty  (in addition to scoreGap)\n", 
                    "id": "#STAR.cwl/scoreGapATAC"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreGapGCAG"
                    }, 
                    "doc": "-4\nGC/AG and CT/GC junction penalty (in addition to scoreGap)\n", 
                    "id": "#STAR.cwl/scoreGapGCAG"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreGapNoncan"
                    }, 
                    "doc": "-8\nint: non-canonical junction penalty (in addition to scoreGap)\n", 
                    "id": "#STAR.cwl/scoreGapNoncan"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreGenomicLengthLog2scale"
                    }, 
                    "doc": "-0.25\nextra score logarithmically scaled with genomic length of the alignment: scoreGenomicLengthLog2scale*log2(genomicLength)\n", 
                    "id": "#STAR.cwl/scoreGenomicLengthLog2scale"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreInsBase"
                    }, 
                    "doc": "-2\ninsertion extension penalty per base (in addition to scoreInsOpen)\n", 
                    "id": "#STAR.cwl/scoreInsBase"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreInsOpen"
                    }, 
                    "doc": "-2\ninsertion open penalty\n", 
                    "id": "#STAR.cwl/scoreInsOpen"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreStitchSJshift"
                    }, 
                    "doc": "1\nmaximum score reduction while searching for SJ boundaries inthe stitching step\n", 
                    "id": "#STAR.cwl/scoreStitchSJshift"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedMultimapNmax"
                    }, 
                    "doc": "10000\nint>0: only pieces that map fewer than this value are utilized in the stitching procedure\n", 
                    "id": "#STAR.cwl/seedMultimapNmax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedNoneLociPerWindow"
                    }, 
                    "doc": "10 \nint>0: max number of one seed loci per window\n", 
                    "id": "#STAR.cwl/seedNoneLociPerWindow"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedPerReadNmax"
                    }, 
                    "doc": "1000\nint>0: max number of seeds per read\n", 
                    "id": "#STAR.cwl/seedPerReadNmax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedPerWindowNmax"
                    }, 
                    "doc": "50\nint>0: max number of seeds per window\n", 
                    "id": "#STAR.cwl/seedPerWindowNmax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedSearchLmax"
                    }, 
                    "doc": "0\nint>=0: defines the maximum length of the seeds, if =0 max seed lengthis infinite\n", 
                    "id": "#STAR.cwl/seedSearchLmax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedSearchStartLmax"
                    }, 
                    "doc": "50\nint>0: defines the search start point through the read - the read is split into pieces no longer than this value\n", 
                    "id": "#STAR.cwl/seedSearchStartLmax"
                }, 
                {
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedSearchStartLmaxOverLread"
                    }, 
                    "doc": "1.0\nfloat: seedSearchStartLmax normalized to read length (sum of mates' lengths for paired-end reads)\n", 
                    "id": "#STAR.cwl/seedSearchStartLmaxOverLread"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbFileChrStartEnd"
                    }, 
                    "doc": "-\nstring(s): path to the files with genomic coordinates (chr <tab> start <tab> end <tab> strand) for the splice junction introns. Multiple files can be supplied wand will be concatenated.\n", 
                    "id": "#STAR.cwl/sjdbFileChrStartEnd"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbGTFchrPrefix"
                    }, 
                    "doc": "string: prefix for chromosome names in a GTF file (e.g. 'chr' for using\nENSMEBL annotations with UCSC geneomes)\n", 
                    "id": "#STAR.cwl/sjdbGTFchrPrefix"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbGTFfeatureExon"
                    }, 
                    "doc": "exon\nstring: feature type in GTF file to be used as exons for building\ntranscripts\n", 
                    "id": "#STAR.cwl/sjdbGTFfeatureExon"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbGTFfile"
                    }, 
                    "doc": "string: path to the GTF file with annotations\n", 
                    "id": "#STAR.cwl/sjdbGTFfile"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbGTFtagExonParentGene"
                    }, 
                    "doc": "gene_id\nstring: tag name to be used as exons' gene-parents (default \"gene_id\" works for GTF files)\n", 
                    "id": "#STAR.cwl/sjdbGTFtagExonParentGene"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbGTFtagExonParentTranscript"
                    }, 
                    "doc": "transcript_id\nstring: tag name to be used as exons' transcript-parents (default\n\"transcript_id\" works for GTF files)\n", 
                    "id": "#STAR.cwl/sjdbGTFtagExonParentTranscript"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbInsertSave"
                    }, 
                    "doc": "Basic\nstring: which files to save when sjdb junctions are inserted on the fly at the mapping step\nBasic ... only small junction / transcript files\nAll   ... all files including big Genome, SA and SAindex - this will create a complete genome directory\n", 
                    "id": "#STAR.cwl/sjdbInsertSave"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbOverhang"
                    }, 
                    "doc": "100\nint>0: length of the donor/acceptor sequence on each side of the junctions, ideally = (mate_length - 1)\n", 
                    "id": "#STAR.cwl/sjdbOverhang"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbScore"
                    }, 
                    "doc": "2\nint: extra alignment score for alignmets that cross database junctions\n", 
                    "id": "#STAR.cwl/sjdbScore"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sysShell"
                    }, 
                    "doc": "string: path to the shell binary, preferrably bash, e.g. /bin/bash.\n- ... the default shell is executed, typically /bin/sh. This was reported to fail on some Ubuntu systems - then you need to specify path to bash.\n", 
                    "id": "#STAR.cwl/sysShell"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--twopass1readsN"
                    }, 
                    "doc": "int: number of reads to process for the 1st step. Use very large number (or\ndefault -1) to map all reads in the first step.\n", 
                    "id": "#STAR.cwl/twopass1readsN"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--twopassMode"
                    }, 
                    "doc": "None\nstring: 2-pass mapping mode.\nNone        ... 1-pass mapping\nBasic       ... basic 2-pass mapping, with all 1st pass junctions inserted into the genome indices on the fly\n", 
                    "id": "#STAR.cwl/twopassMode"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--winAnchorDistNbins"
                    }, 
                    "doc": "9\nint>0: max number of bins between two anchors that allows aggregation of anchors into one window\n", 
                    "id": "#STAR.cwl/winAnchorDistNbins"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--winAnchorMultimapNmax"
                    }, 
                    "doc": "50\nint>0: max number of loci anchors are allowed to map to\n", 
                    "id": "#STAR.cwl/winAnchorMultimapNmax"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--winBinNbits"
                    }, 
                    "doc": "16\nint>0: =log2(winBin), where winBin is the size of the bin for the windows/clustering, each window will occupy an integer number of bins.\n", 
                    "id": "#STAR.cwl/winBinNbits"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--winFlankNbins"
                    }, 
                    "doc": "4\nint>0: log2(winFlank), where win Flank is the size of the left and right flanking regions for each window\n", 
                    "id": "#STAR.cwl/winFlankNbins"
                }
            ], 
            "outputs": [
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "outputBinding": {
                        "glob": "${\n  if (inputs.runMode == \"genomeGenerate\")\n    return [];\n\n  var p = inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\";\n  if (inputs.outSAMtype.indexOf(\"SAM\") > -1) {\n      return p+\"Aligned.out.sam\";\n  } else {\n   if ( inputs.outSAMtype.indexOf(\"SortedByCoordinate\") > -1 )\n      return p+\"Aligned.sortedByCoord.out.bam\";\n    else\n      return p+\"Aligned.out.bam\";\n  }\n}\n"
                    }, 
                    "id": "#STAR.cwl/aligned"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "outputBinding": {
                        "glob": "${\n  if (inputs.runMode != \"genomeGenerate\")\n    return [];\n  return inputs.genomeDir;\n}\n"
                    }, 
                    "id": "#STAR.cwl/indices"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File"
                        }
                    ], 
                    "outputBinding": {
                        "glob": "${\n    var p = inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\";\n    return [p + \"Log.final.out\", p + \"SJ.out.tab\", p + \"Log.out\"];\n  }\n"
                    }, 
                    "id": "#STAR.cwl/logs"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "outputBinding": {
                        "loadContents": true, 
                        "glob": "${\n  if (inputs.runMode == \"genomeGenerate\")\n    return [];\n\n  var p = inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\";\n  return p+\"Log.final.out\";\n}\n", 
                        "outputEval": "${\n  if (inputs.runMode == \"genomeGenerate\")\n    return \"\";\n\n  var s = self[0].contents.replace(/[ ]+.*?:\\n|[ ]{2,}|\\n$/g,\"\").\n      split(/\\n{1,2}/g).map(function(v){var s=v.split(/\\|\\t/g); var o={}; o[s[0]]=s[1]; return o;})\n  return JSON.stringify(s);\n}\n"
                    }, 
                    "id": "#STAR.cwl/mappingstats"
                }
            ], 
            "baseCommand": [
                "STAR"
            ], 
            "id": "#STAR.cwl", 
            "http://schema.org/mainEntity": {
                "class": "http://schema.org/SoftwareSourceCode", 
                "http://schema.org/name": "STAR", 
                "http://schema.org/about": "Aligns RNA-seq reads to a reference genome using uncompressed suffix arrays. STAR has a potential for accurately aligning long (several kilobases) reads that are emerging from the third-generation sequencing technologies.\n", 
                "http://schema.org/url": "https://github.com/alexdobin/STAR", 
                "http://schema.org/codeRepository": "https://github.com/alexdobin/STAR.git", 
                "http://schema.org/license": [
                    "https://opensource.org/licenses/GPL-3.0"
                ], 
                "http://schema.org/targetProduct": {
                    "class": "http://schema.org/SoftwareApplication", 
                    "http://schema.org/softwareVersion": "2.5.0b", 
                    "http://schema.org/applicationCategory": "commandline tool"
                }, 
                "http://schema.org/programmingLanguage": "C++", 
                "http://schema.org/publication": [
                    {
                        "class": "http://schema.org/ScholarlyArticle", 
                        "id": "#bts635"
                    }
                ], 
                "http://schema.org/author": [
                    {
                        "class": "http://schema.org/Person", 
                        "id": "#STAR.cwl/dobin@cshl.edu", 
                        "http://schema.org/name": "Alexander Dobin", 
                        "http://schema.org/email": "mailto:dobin@cshl.edu", 
                        "http://schema.org/worksFor": [
                            {
                                "class": "http://schema.org/Organization", 
                                "http://schema.org/name": "Cold Spring Harbor Laboratory, Cold Spring Harbor, NY, USA"
                            }
                        ]
                    }
                ]
            }, 
            "http://schema.org/downloadUrl": "https://github.com/common-workflow-language/workflows/blob/master/tools/STAR.cwl", 
            "http://schema.org/codeRepository": "https://github.com/common-workflow-language/workflows", 
            "http://schema.org/isPartOf": {
                "class": "http://schema.org/CreativeWork", 
                "http://schema.org/name": "Common Workflow Language", 
                "http://schema.org/url": "http://commonwl.org/"
            }, 
            "http://schema.org/author": {
                "class": "http://schema.org/Person", 
                "http://schema.org/name": "Andrey Kartashov", 
                "http://schema.org/email": "mailto:Andrey.Kartashov@cchmc.org", 
                "http://schema.org/sameAs": [
                    {
                        "id": "#0000-0001-9102-5681"
                    }
                ], 
                "http://schema.org/worksFor": [
                    {
                        "class": "http://schema.org/Organization", 
                        "http://schema.org/name": "Cincinnati Children's Hospital Medical Center", 
                        "http://schema.org/location": "3333 Burnet Ave, Cincinnati, OH 45229-3026", 
                        "http://schema.org/department": [
                            {
                                "class": "http://schema.org/Organization", 
                                "http://schema.org/name": "Barski Lab"
                            }
                        ]
                    }
                ]
            }
        }, 
        {
            "class": "CommandLineTool", 
            "hints": [
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/fastqc:0.11.4"
                }, 
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "0.11.4"
                            ], 
                            "package": "fastqc", 
                            "https://schema.org/citation": "https://www.bioinformatics.babraham.ac.uk/projects/fastqc/"
                        }
                    ]
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "default": "fastq", 
                    "inputBinding": {
                        "position": 3, 
                        "prefix": "--format"
                    }, 
                    "id": "#fastqc.cwl/format"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 4
                    }, 
                    "id": "#fastqc.cwl/input_fastq_file"
                }, 
                {
                    "type": "boolean", 
                    "default": true, 
                    "inputBinding": {
                        "prefix": "--noextract", 
                        "position": 2
                    }, 
                    "id": "#fastqc.cwl/noextract"
                }, 
                {
                    "type": "int", 
                    "default": 1, 
                    "inputBinding": {
                        "position": 5, 
                        "prefix": "--threads"
                    }, 
                    "id": "#fastqc.cwl/threads"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "*_fastqc.zip"
                    }, 
                    "id": "#fastqc.cwl/output_qc_report"
                }
            ], 
            "baseCommand": "fastqc", 
            "arguments": [
                {
                    "valueFrom": "$('/tmp')", 
                    "prefix": "--dir", 
                    "position": 5
                }, 
                {
                    "valueFrom": "$(runtime.outdir)", 
                    "prefix": "-o", 
                    "position": 5
                }
            ], 
            "id": "#fastqc.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "hints": [
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "quay.io/dukegcb/htseq", 
                    "dockerFile": "$import: HTSeq/Dockerfile\n"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "label": "", 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "id": "#htseq-count.cwl/alignment_file"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "label": "feature type (3rd column in GFF file) to be used, all features of other type are ignored (default, suitable for Ensembl GTF files: exon)", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-t"
                    }, 
                    "id": "#htseq-count.cwl/featuretype"
                }, 
                {
                    "type": "File", 
                    "label": "", 
                    "inputBinding": {
                        "position": 3
                    }, 
                    "id": "#htseq-count.cwl/gff_file"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "label": "GFF attribute to be used as feature ID (default, suitable for Ensembl GTF files: gene_id)", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-i"
                    }, 
                    "id": "#htseq-count.cwl/idattr"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "label": "", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-a"
                    }, 
                    "id": "#htseq-count.cwl/minaqual"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "label": "", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-m"
                    }, 
                    "id": "#htseq-count.cwl/mode"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "label": "", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-r"
                    }, 
                    "id": "#htseq-count.cwl/order"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "label": "", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-o"
                    }, 
                    "id": "#htseq-count.cwl/samout"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "label": "", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-f"
                    }, 
                    "id": "#htseq-count.cwl/samtype"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "label": "", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-s"
                    }, 
                    "id": "#htseq-count.cwl/stranded"
                }
            ], 
            "outputs": [
                {
                    "type": "stdout", 
                    "id": "#htseq-count.cwl/output"
                }
            ], 
            "baseCommand": [
                "htseq-count"
            ], 
            "stdout": "htseq-count.txt", 
            "id": "#htseq-count.cwl"
        }, 
        {
            "class": "ExpressionTool", 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "id": "#merge-secondary-file.cwl/primary"
                }, 
                {
                    "type": "File", 
                    "id": "#merge-secondary-file.cwl/secondary"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "id": "#merge-secondary-file.cwl/merged"
                }
            ], 
            "expression": "${\n  var ret = inputs.primary;\n  ret[\"secondaryFiles\"] = [inputs.secondary];\n  return {\"merged\": ret };\n}\n", 
            "id": "#merge-secondary-file.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "hints": [
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "quay.io/dukegcb/rseqc", 
                    "dockerFile": "$import RSeQC/Dockerfile\n"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "label": "Alignment file in BAM or SAM format", 
                    "inputBinding": {
                        "prefix": "-i"
                    }, 
                    "id": "#read_distribution.cwl/input"
                }, 
                {
                    "type": "File", 
                    "label": "Reference gene model in bed format", 
                    "inputBinding": {
                        "prefix": "-r"
                    }, 
                    "id": "#read_distribution.cwl/ref_gene_model"
                }
            ], 
            "outputs": [
                {
                    "type": "stdout", 
                    "id": "#read_distribution.cwl/output"
                }
            ], 
            "baseCommand": [
                "read_distribution.py"
            ], 
            "stdout": "read_distribution.txt", 
            "id": "#read_distribution.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "requirements": [
                {
                    "$import": "#envvar-global.yml"
                }, 
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "scidap/samtools:v1.2-242-4d56437", 
                    "dockerFile": "$import: samtools-Dockerfile\n", 
                    "id": "#samtools-docker.yml", 
                    "name": "#samtools-docker.yml"
                }, 
                {
                    "class": "InlineJavascriptRequirement", 
                    "expressionLib": [
                        "var new_ext = function() { var ext=inputs.bai?'.bai':inputs.csi?'.csi':'.bai'; return inputs.input.path.split('/').slice(-1)[0]+ext; };"
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": "boolean", 
                    "default": false, 
                    "doc": "Generate BAI-format index for BAM files [default]\n", 
                    "id": "#samtools-index.cwl/bai"
                }, 
                {
                    "type": "boolean", 
                    "default": false, 
                    "doc": "Generate CSI-format index for BAM files\n", 
                    "id": "#samtools-index.cwl/csi"
                }, 
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "doc": "Input bam file.\n", 
                    "id": "#samtools-index.cwl/input"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-m"
                    }, 
                    "doc": "Set minimum interval size for CSI indices to 2^INT [14]\n", 
                    "id": "#samtools-index.cwl/interval"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(new_ext())"
                    }, 
                    "doc": "The index file", 
                    "id": "#samtools-index.cwl/index"
                }
            ], 
            "baseCommand": [
                "samtools", 
                "index"
            ], 
            "arguments": [
                {
                    "valueFrom": "$(inputs.bai?'-b':inputs.csi?'-c':[])", 
                    "position": 1
                }, 
                {
                    "valueFrom": "$(new_ext())", 
                    "position": 3
                }
            ], 
            "doc": "samtools-index.cwl is developed for CWL consortium\n", 
            "id": "#samtools-index.cwl", 
            "http://schema.org/mainEntity": {
                "class": "http://schema.org/SoftwareSourceCode", 
                "id": "#samtools-metadata.yaml", 
                "name": "#samtools-metadata.yaml", 
                "http://schema.org/name": "samtools", 
                "http://schema.org/about": "A suite of programs for interacting with high-throughput sequencing data. It consists of three separate repositories: Samtools (Reading/writing/editing/indexing/viewing SAM/BAM/CRAM format), BCFtools (Reading/writing BCF2/VCF/gVCF files and calling/filtering/summarising SNP and short indel sequence variants) and HTSlib (A C library for reading/writing high-throughput sequencing data).\n", 
                "http://schema.org/url": "http://www.htslib.org/", 
                "http://schema.org/codeRepository": "https://github.com/samtools/samtools.git", 
                "http://schema.org/license": [
                    "https://opensource.org/licenses/MIT", 
                    "https://opensource.org/licenses/BSD-3-Clause"
                ], 
                "http://schema.org/targetProduct": {
                    "class": "http://schema.org/SoftwareApplication", 
                    "http://schema.org/softwareVersion": "1.2-242-4d56437", 
                    "http://schema.org/applicationCategory": "commandline tool"
                }, 
                "http://schema.org/programmingLanguage": "C, Perl", 
                "http://schema.org/publication": [
                    {
                        "class": "http://schema.org/ScholarlyArticle", 
                        "id": "#btr509", 
                        "http://schema.org/name": "(Li, 2011) A statistical framework for SNP calling, mutation discovery, association mapping and population genetical parameter estimation from sequencing data. Bioinformatics.", 
                        "http://schema.org/url": "http://www.ncbi.nlm.nih.gov/pubmed/21903627"
                    }, 
                    {
                        "class": "http://schema.org/ScholarlyArticle", 
                        "id": "#btr076", 
                        "http://schema.org/name": "(Li, 2011) Improving SNP discovery by base alignment quality. Bioinformatics.", 
                        "http://schema.org/url": "http://www.ncbi.nlm.nih.gov/pubmed/21320865"
                    }, 
                    {
                        "class": "http://schema.org/ScholarlyArticle", 
                        "id": "#btp352", 
                        "http://schema.org/name": "(Li et al., 2009) The Sequence Alignment/Map format and SAMtools. Bioinformatics.", 
                        "http://schema.org/url": "http://www.ncbi.nlm.nih.gov/pubmed/19505943"
                    }
                ], 
                "http://schema.org/discussionUrl": [
                    "https://lists.sourceforge.net/lists/listinfo/samtools-help", 
                    "https://lists.sourceforge.net/lists/listinfo/samtools-devel"
                ], 
                "http://schema.org/creator": [
                    {
                        "class": "http://schema.org/Organization", 
                        "http://schema.org/name": "Sanger Institute", 
                        "http://schema.org/member": [
                            {
                                "class": "http://schema.org/Person", 
                                "http://schema.org/name": "Heng Li", 
                                "http://schema.org/description": "wrote most of the initial source codes of SAMtools and various converters."
                            }
                        ]
                    }, 
                    {
                        "class": "http://schema.org/Organization", 
                        "http://schema.org/name": "Broad Institute", 
                        "http://schema.org/member": [
                            {
                                "class": "http://schema.org/Person", 
                                "http://schema.org/name": "Bob Handsaker", 
                                "http://schema.org/description": "A major contributor to the\nSAM/BAM specification. He designed and implemented the BGZF format, the\nunderlying indexable compression format for the BAM format. BGZF does\nnot support arithmetic between file offsets.\n"
                            }
                        ]
                    }, 
                    {
                        "class": "http://schema.org/Organization", 
                        "http://schema.org/name": "Beijing Genome Institute", 
                        "http://schema.org/member": [
                            {
                                "class": "http://schema.org/Person", 
                                "http://schema.org/name": "Jue Ruan", 
                                "http://schema.org/description": "Designed and implemented the\nRAZF format, an alternative indexable compression format. RAZF is no longer\nused by or provided with SAMtools. Source code remains available in older\nSAMtools 0.1.x releases and from the standalone branch in the repository.\n"
                            }
                        ]
                    }, 
                    {
                        "class": "http://schema.org/Person", 
                        "http://schema.org/name": "Colin Hercus", 
                        "http://schema.org/description": "updated novo2sam.pl to support gapped alignment by novoalign."
                    }, 
                    {
                        "class": "http://schema.org/Person", 
                        "http://schema.org/name": "Petr Danecek", 
                        "http://schema.org/description": "contributed the header parsing library sam_header.c and sam2vcf.pl script."
                    }
                ]
            }, 
            "http://schema.org/downloadUrl": "https://github.com/common-workflow-language/workflows/blob/master/tools/samtools-index.cwl", 
            "http://schema.org/codeRepository": "https://github.com/common-workflow-language/workflows", 
            "http://schema.org/license": "http://www.apache.org/licenses/LICENSE-2.0", 
            "http://schema.org/isPartOf": {
                "class": "http://schema.org/CreativeWork", 
                "http://schema.org/name": "Common Workflow Language", 
                "http://schema.org/url": "http://commonwl.org/"
            }, 
            "http://schema.org/author": {
                "class": "http://schema.org/Person", 
                "http://schema.org/name": "Andrey Kartashov", 
                "http://schema.org/email": "mailto:Andrey.Kartashov@cchmc.org", 
                "http://schema.org/sameAs": [
                    {
                        "$import": "#0000-0001-9102-5681"
                    }
                ], 
                "http://schema.org/worksFor": [
                    {
                        "class": "http://schema.org/Organization", 
                        "http://schema.org/name": "Cincinnati Children's Hospital Medical Center", 
                        "http://schema.org/location": "3333 Burnet Ave, Cincinnati, OH 45229-3026", 
                        "http://schema.org/department": [
                            {
                                "class": "http://schema.org/Organization", 
                                "http://schema.org/name": "Barski Lab"
                            }
                        ]
                    }
                ]
            }
        }, 
        {
            "class": "CommandLineTool", 
            "hints": [
                {
                    "class": "DockerRequirement", 
                    "dockerPull": "dukegcb/trim-galore:0.4.4"
                }, 
                {
                    "class": "SoftwareRequirement", 
                    "packages": [
                        {
                            "version": [
                                "1.14"
                            ], 
                            "package": "cutadapt", 
                            "https://schema.org/citation": "https://dx.doi.org/10.14806/ej.17.1.200"
                        }, 
                        {
                            "version": [
                                "0.4.4"
                            ], 
                            "package": "trimgalore", 
                            "https://schema.org/citation": "https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/"
                        }
                    ]
                }
            ], 
            "inputs": [
                {
                    "type": "boolean", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--paired"
                    }, 
                    "id": "#trim_galore.cwl/paired"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "inputBinding": {
                        "position": 3
                    }, 
                    "id": "#trim_galore.cwl/reads"
                }
            ], 
            "outputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "outputBinding": {
                        "glob": "*_trimming_report.txt"
                    }, 
                    "id": "#trim_galore.cwl/trim_reports"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "outputBinding": {
                        "glob": "*_val_*.fq*"
                    }, 
                    "id": "#trim_galore.cwl/trimmed_reads"
                }
            ], 
            "baseCommand": "trim_galore", 
            "arguments": [
                {
                    "valueFrom": "$(runtime.outdir)", 
                    "prefix": "-o", 
                    "position": 2
                }
            ], 
            "id": "#trim_galore.cwl"
        }, 
        {
            "class": "Workflow", 
            "doc": "Star/HTSeq RNA Seq Pipeline", 
            "requirements": [
                {
                    "class": "ScatterFeatureRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "doc": "STAR output files name prefix", 
                    "id": "#main/align_out_prefix"
                }, 
                {
                    "type": "File", 
                    "doc": "Genomic features in the GFF format", 
                    "id": "#main/gff_file"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "doc": "Sequences to be mapped (e.g. RNA-seq FASTQ files)", 
                    "id": "#main/reads"
                }, 
                {
                    "type": "File", 
                    "doc": "Reference gene model in bed format", 
                    "id": "#main/ref_gene_model"
                }, 
                {
                    "type": "Directory", 
                    "doc": "Genome directory containing STAR genome indices", 
                    "id": "#main/star_genome"
                }, 
                {
                    "type": "int", 
                    "doc": "Number of threads", 
                    "id": "#main/threads"
                }
            ], 
            "outputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "outputSource": "#main/align/logs", 
                    "doc": "STAR alignment log files", 
                    "id": "#main/align_logs"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/align/aligned", 
                    "doc": "STAR alignments in SAM format", 
                    "id": "#main/aligned_read"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/index/index", 
                    "doc": "BAM files indexed by samtools", 
                    "id": "#main/aligned_read_index"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "outputSource": "#main/qc/output_qc_report", 
                    "doc": "FastQC reports for input sequences", 
                    "id": "#main/qc_reports"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/quantification/output", 
                    "doc": "HTSeq feature counts report", 
                    "id": "#main/quantification_report"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/read_distribution/output", 
                    "doc": "RSeQC read distribution report", 
                    "id": "#main/read_distribution_report"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "outputSource": "#main/trim/trim_reports", 
                    "doc": "Trim Galore! summary reports", 
                    "id": "#main/trim_reports"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "outputSource": "#main/trim/trimmed_reads", 
                    "doc": "Input reads trimmed by Trim Galore!", 
                    "id": "#main/trimmed_reads"
                }
            ], 
            "steps": [
                {
                    "run": "#STAR.cwl", 
                    "in": [
                        {
                            "default": 500, 
                            "id": "#main/align/alignSJoverhangMin"
                        }, 
                        {
                            "source": "#main/star_genome", 
                            "id": "#main/align/genomeDir"
                        }, 
                        {
                            "source": "#main/align_out_prefix", 
                            "id": "#main/align/outFileNamePrefix"
                        }, 
                        {
                            "default": 1, 
                            "id": "#main/align/outFilterMultimapNmax"
                        }, 
                        {
                            "default": "Standard", 
                            "id": "#main/align/outSAMattributes"
                        }, 
                        {
                            "default": "intronMotif", 
                            "id": "#main/align/outSAMstrandField"
                        }, 
                        {
                            "default": [
                                "BAM", 
                                "SortedByCoordinate"
                            ], 
                            "id": "#main/align/outSAMtype"
                        }, 
                        {
                            "source": "#main/trim/trimmed_reads", 
                            "id": "#main/align/readFilesIn"
                        }, 
                        {
                            "source": "#main/threads", 
                            "id": "#main/align/runThreadN"
                        }
                    ], 
                    "out": [
                        "#main/align/aligned", 
                        "#main/align/logs"
                    ], 
                    "id": "#main/align"
                }, 
                {
                    "run": "#samtools-index.cwl", 
                    "in": [
                        {
                            "default": true, 
                            "id": "#main/index/bai"
                        }, 
                        {
                            "source": "#main/align/aligned", 
                            "id": "#main/index/input"
                        }
                    ], 
                    "out": [
                        "#main/index/index"
                    ], 
                    "id": "#main/index"
                }, 
                {
                    "run": "#merge-secondary-file.cwl", 
                    "in": [
                        {
                            "source": "#main/align/aligned", 
                            "id": "#main/merge_index/primary"
                        }, 
                        {
                            "source": "#main/index/index", 
                            "id": "#main/merge_index/secondary"
                        }
                    ], 
                    "out": [
                        "#main/merge_index/merged"
                    ], 
                    "id": "#main/merge_index"
                }, 
                {
                    "run": "#fastqc.cwl", 
                    "scatter": "#main/qc/input_fastq_file", 
                    "in": [
                        {
                            "source": "#main/reads", 
                            "id": "#main/qc/input_fastq_file"
                        }, 
                        {
                            "source": "#main/threads", 
                            "id": "#main/qc/threads"
                        }
                    ], 
                    "out": [
                        "#main/qc/output_qc_report"
                    ], 
                    "id": "#main/qc"
                }, 
                {
                    "run": "#htseq-count.cwl", 
                    "in": [
                        {
                            "source": "#main/merge_index/merged", 
                            "id": "#main/quantification/alignment_file"
                        }, 
                        {
                            "source": "#main/gff_file", 
                            "id": "#main/quantification/gff_file"
                        }, 
                        {
                            "default": "Parent", 
                            "id": "#main/quantification/idattr"
                        }, 
                        {
                            "default": "pos", 
                            "id": "#main/quantification/order"
                        }, 
                        {
                            "default": "bam", 
                            "id": "#main/quantification/samtype"
                        }, 
                        {
                            "default": "no", 
                            "id": "#main/quantification/stranded"
                        }
                    ], 
                    "out": [
                        "#main/quantification/output"
                    ], 
                    "id": "#main/quantification"
                }, 
                {
                    "run": "#read_distribution.cwl", 
                    "in": [
                        {
                            "source": "#main/merge_index/merged", 
                            "id": "#main/read_distribution/input"
                        }, 
                        {
                            "source": "#main/ref_gene_model", 
                            "id": "#main/read_distribution/ref_gene_model"
                        }
                    ], 
                    "out": [
                        "#main/read_distribution/output"
                    ], 
                    "id": "#main/read_distribution"
                }, 
                {
                    "run": "#trim_galore.cwl", 
                    "in": [
                        {
                            "default": true, 
                            "id": "#main/trim/paired"
                        }, 
                        {
                            "source": "#main/reads", 
                            "id": "#main/trim/reads"
                        }
                    ], 
                    "out": [
                        "#main/trim/trimmed_reads", 
                        "#main/trim/trim_reports"
                    ], 
                    "id": "#main/trim"
                }
            ], 
            "id": "#main"
        }
    ]
}