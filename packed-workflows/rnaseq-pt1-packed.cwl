{
    "cwlVersion": "v1.0", 
    "$graph": [
        {
            "inputs": [
                {
                    "doc": "Local\nstring: type of read ends alignment\nLocal           ... standard local alignment with soft-clipping allowed\nEndToEnd        ... force end-to-end read alignment, do not soft-clip\nExtend5pOfRead1 ... fully extend only the 5p of the read1, all other ends: local alignment\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignEndsType"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/alignEndsType"
                }, 
                {
                    "doc": "0\nmaximum intron size, if 0, max intron size will be determined by (2^winBinNbits)*winAnchorDistNbins\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignIntronMax"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/alignIntronMax"
                }, 
                {
                    "doc": "21\nminimum intron size: genomic gap is considered intron if its length>=alignIntronMin, otherwise it is considered Deletion\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignIntronMin"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/alignIntronMin"
                }, 
                {
                    "doc": "0\nmaximum gap between two mates, if 0, max intron gap will be determined by (2^winBinNbits)*winAnchorDistNbins\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignMatesGapMax"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/alignMatesGapMax"
                }, 
                {
                    "doc": "3\nint>0: minimum overhang (i.e. block size) for annotated (sjdb) spliced alignments\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignSJDBoverhangMin"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/alignSJDBoverhangMin"
                }, 
                {
                    "doc": "5\nint>0: minimum overhang (i.e. block size) for spliced alignments\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignSJoverhangMin"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/alignSJoverhangMin"
                }, 
                {
                    "doc": "0 -1 0 0\n4*int>=0: maximum number of mismatches for stitching of the splice junctions (-1: no limit).\n(1) non-canonical motifs, (2) GT/AG and CT/AC motif, (3) GC/AG and CT/GC motif, (4) AT/AC and GT/AT motif.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignSJstitchMismatchNmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/alignSJstitchMismatchNmax"
                }, 
                {
                    "doc": "Yes\nstring: allow the soft-clipping of the alignments past the end of the chromosomes\nYes ... allow\nNo  ... prohibit, useful for compatibility with Cufflinks\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignSoftClipAtReferenceEnds"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/alignSoftClipAtReferenceEnds"
                }, 
                {
                    "doc": "0\nint>0: minimum mapped length for a read mate that is spliced\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignSplicedMateMapLmin"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/alignSplicedMateMapLmin"
                }, 
                {
                    "doc": "0.66\nfloat>0: alignSplicedMateMapLmin normalized to mate length\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignSplicedMateMapLminOverLmate"
                    }, 
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "id": "#STAR.cwl/alignSplicedMateMapLminOverLmate"
                }, 
                {
                    "doc": "10000\nint>0: max number of different alignments per read to consider\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignTranscriptsPerReadNmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/alignTranscriptsPerReadNmax"
                }, 
                {
                    "doc": "100\nint>0: max number of transcripts per window\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignTranscriptsPerWindowNmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/alignTranscriptsPerWindowNmax"
                }, 
                {
                    "doc": "10000\nint>0: max number of windows per read\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--alignWindowsPerReadNmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/alignWindowsPerReadNmax"
                }, 
                {
                    "doc": "int>0: number of bases from the 5' of mate 2 to use in collapsing (e.g. for\nRAMPAGE)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--bamRemoveDuplicatesMate2basesN"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/bamRemoveDuplicatesMate2basesN"
                }, 
                {
                    "doc": "-\nstring: mark duplicates in the BAM file, for now only works with sorted BAM feeded with inputBAMfile\n-               ... no duplicate removal/marking\nUniqueIdentical ... mark all multimappers, and duplicate unique mappers. The coordinates, FLAG, CIGAR must be identical\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--bamRemoveDuplicatesType"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/bamRemoveDuplicatesType"
                }, 
                {
                    "doc": "banGenomicN\nstring(s): different filters for chimeric alignments\nNone ... no filtering\nbanGenomicN ... Ns are not allowed in the genome sequence around the chimeric junction\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimFilter"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/chimFilter"
                }, 
                {
                    "doc": "20\nint>=0: minimum overhang for a chimeric junction\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimJunctionOverhangMin"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/chimJunctionOverhangMin"
                }, 
                {
                    "doc": "SeparateSAMold\nstring: type of chimeric output\nSeparateSAMold  ... output old SAM into separate Chimeric.out.sam file\nWithinBAM       ... output into main aligned BAM files (Aligned.*.bam)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimOutType"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/chimOutType"
                }, 
                {
                    "doc": "20\nint>=0: max drop (difference) of chimeric score (the sum of scores of all chimeric segements) from the read length\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimScoreDropMax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/chimScoreDropMax"
                }, 
                {
                    "doc": "-1\nint: penalty for a non-GT/AG chimeric junction\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimScoreJunctionNonGTAG"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/chimScoreJunctionNonGTAG"
                }, 
                {
                    "doc": "0\nint>=0: minimum total (summed) score of the chimeric segments\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimScoreMin"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/chimScoreMin"
                }, 
                {
                    "doc": "int>=0: minimum difference (separation) between the best chimeric score and\nthe next one\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimScoreSeparation"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/chimScoreSeparation"
                }, 
                {
                    "doc": "0\nint>=0: minimum length of chimeric segment length, if ==0, no chimeric output\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimSegmentMin"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/chimSegmentMin"
                }, 
                {
                    "doc": "0\nint>=0: maximum gap in the read sequence between chimeric segments\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--chimSegmentReadGapMax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/chimSegmentReadGapMax"
                }, 
                {
                    "doc": "double(s): max proportion of mismatches for 3p adpater clipping for each\nmate.  If one value is given, it will be assumed the same for both mates.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--clip3pAdapterMMp"
                    }, 
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "id": "#STAR.cwl/clip3pAdapterMMp"
                }, 
                {
                    "doc": "string(s): adapter sequences to clip from 3p of each mate.  If one value is\ngiven, it will be assumed the same for both mates.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--clip3pAdapterSeq"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/clip3pAdapterSeq"
                }, 
                {
                    "doc": "int(s): number of bases to clip from 3p of each mate after the adapter\nclipping. If one value is given, it will be assumed the same for both\nmates.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--clip3pAfterAdapterNbases"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/clip3pAfterAdapterNbases"
                }, 
                {
                    "doc": "int(s): number(s) of bases to clip from 3p of each mate. If one value is\ngiven, it will be assumed the same for both mates.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--clip3pNbases"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/clip3pNbases"
                }, 
                {
                    "doc": "int(s): number(s) of bases to clip from 5p of each mate. If one value is\ngiven, it will be assumed the same for both mates.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--clip5pNbases"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/clip5pNbases"
                }, 
                {
                    "doc": "int: =log2(chrBin), where chrBin is the size of the bins for genome\nstorage: each chromosome will occupy an integer number of bins\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--genomeChrBinNbits"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/genomeChrBinNbits"
                }, 
                {
                    "doc": "string: path to the directory where genome files are stored (if\nrunMode!=generateGenome) or will be generated (if runMode==generateGenome)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--genomeDir"
                    }, 
                    "type": "Directory", 
                    "id": "#STAR.cwl/genomeDir"
                }, 
                {
                    "doc": "string(s): path(s) to the fasta files with genomic sequences for genome\ngeneration, separated by spaces. Only used if runMode==genomeGenerate.\nThese files should be plain text FASTA files, they *cannot* be zipped.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--genomeFastaFiles", 
                        "itemSeparator": " "
                    }, 
                    "type": [
                        "null", 
                        {
                            "items": "File", 
                            "type": "array"
                        }
                    ], 
                    "id": "#STAR.cwl/genomeFastaFiles"
                }, 
                {
                    "doc": "NoSharedMemory\nstring: mode of shared memory usage for the genome files\nLoadAndKeep     ... load genome into shared and keep it in memory after run\nLoadAndRemove   ... load genome into shared but remove it after run\nLoadAndExit     ... load genome into shared memory and exit, keeping the genome in memory for future runs\nRemove          ... do not map anything, just remove loaded genome from memory\nNoSharedMemory  ... do not use shared memory, each job will have its own private copy of the genome\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--genomeLoad"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/genomeLoad"
                }, 
                {
                    "doc": "int: length (bases) of the SA pre-indexing string. Typically between 10 and\n15. Longer strings will use much more memory, but allow faster searches.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--genomeSAindexNbases"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/genomeSAindexNbases"
                }, 
                {
                    "doc": "int>0: suffux array sparsity, i.e. distance between indices: use bigger\nnumbers to decrease needed RAM at the cost of mapping speed reduction\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--genomeSAsparseD"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/genomeSAsparseD"
                }, 
                {
                    "doc": "string: path to BAM input file, to be used with --runMode\ninputAlignmentsFromBAM\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--inputBAMfile"
                    }, 
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "id": "#STAR.cwl/inputBAMfile"
                }, 
                {
                    "doc": "int>=0: maximum available RAM for sorting BAM. If =0, it will be set to the\ngenome index size. 0 value can only be used with --genomeLoad\nNoSharedMemory option.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitBAMsortRAM"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/limitBAMsortRAM"
                }, 
                {
                    "doc": "31000000000\nint>0: maximum available RAM (bytes) for genome generation\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitGenomeGenerateRAM"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/limitGenomeGenerateRAM"
                }, 
                {
                    "doc": "150000000\nint>0: max available buffers size (bytes) for input/output, per thread\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitIObufferSize"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/limitIObufferSize"
                }, 
                {
                    "doc": "100000\nint>0: max size of the SAM record for one read. Recommended value: >(2*(LengthMate1+LengthMate2+100)*outFilterMultimapNmax\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitOutSAMoneReadBytes"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/limitOutSAMoneReadBytes"
                }, 
                {
                    "doc": "1000000\nint>0: max number of collapsed junctions\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitOutSJcollapsed"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/limitOutSJcollapsed"
                }, 
                {
                    "doc": "1000\nint>0: max number of junctions for one read (including all multi-mappers)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitOutSJoneRead"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/limitOutSJoneRead"
                }, 
                {
                    "doc": "1000000\nint>=0: maximum number of junction to be inserted to the genome on the fly at the mapping stage, including those from annotations and those detected in the 1st step of the 2-pass run\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--limitSjdbInsertNsj"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/limitSjdbInsertNsj"
                }, 
                {
                    "default": 10, 
                    "doc": "int: -1 to 10  BAM compression level, -1=default compression (6?), 0=no\ncompression, 10=maximum compression\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outBAMcompression"
                    }, 
                    "type": "int", 
                    "id": "#STAR.cwl/outBAMcompression"
                }, 
                {
                    "doc": "int: >=0: number of threads for BAM sorting. 0 will default to\nmin(6,--runThreadN).\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outBAMsortingThreadN"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outBAMsortingThreadN"
                }, 
                {
                    "doc": "string: output files name prefix (including full or relative path). Can\nonly be defined on the command line.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFileNamePrefix"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outFileNamePrefix"
                }, 
                {
                    "doc": "None\nstring: filter alignment using their motifs\nNone                           ... no filtering\nRemoveNoncanonical             ... filter out alignments that contain non-canonical junctions\nRemoveNoncanonicalUnannotated  ... filter out alignments that contain non-canonical unannotated junctions when using annotated splice junctions database. The annotated non-canonical junctions will be kept.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterIntronMotifs"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outFilterIntronMotifs"
                }, 
                {
                    "doc": "0\nint: alignment will be output only if the number of matched bases is higher than this value\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMatchNmin"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outFilterMatchNmin"
                }, 
                {
                    "doc": "0.66\nfloat: outFilterMatchNmin normalized to read length (sum of mates' lengths for paired-end reads)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMatchNminOverLread"
                    }, 
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "id": "#STAR.cwl/outFilterMatchNminOverLread"
                }, 
                {
                    "doc": "10\nint: alignment will be output only if it has fewer mismatches than this value\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMismatchNmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outFilterMismatchNmax"
                }, 
                {
                    "doc": "0.3\nint: alignment will be output only if its ratio of mismatches to *mapped* length is less than this value\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMismatchNoverLmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outFilterMismatchNoverLmax"
                }, 
                {
                    "doc": "1\nint: alignment will be output only if its ratio of mismatches to *read* length is less than this value\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMismatchNoverReadLmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outFilterMismatchNoverReadLmax"
                }, 
                {
                    "doc": "10\nint: read alignments will be output only if the read maps fewer than this value, otherwise no alignments will be output\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMultimapNmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outFilterMultimapNmax"
                }, 
                {
                    "doc": "1\nint: the score range below the maximum score for multimapping alignments\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterMultimapScoreRange"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outFilterMultimapScoreRange"
                }, 
                {
                    "doc": "0\nint: alignment will be output only if its score is higher than this value\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterScoreMin"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outFilterScoreMin"
                }, 
                {
                    "doc": "0.66\nfloat: outFilterScoreMin normalized to read length (sum of mates' lengths for paired-end reads)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterScoreMinOverLread"
                    }, 
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "id": "#STAR.cwl/outFilterScoreMinOverLread"
                }, 
                {
                    "doc": "Normal\nstring: type of filtering\nNormal  ... standard filtering using only current alignment\nBySJout ... keep only those reads that contain junctions that passed filtering into SJ.out.tab\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outFilterType"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outFilterType"
                }, 
                {
                    "doc": "Old_2.4\nstring: order of multimapping alignments in the output files\nOld_2.4             ... quasi-random order used before 2.5.0\nRandom              ... random order of alignments for each multi-mapper. Read mates (pairs) are always adjacent, all alignment for each read stay together. This option will become default in the future releases.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outMultimapperOrder"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outMultimapperOrder"
                }, 
                {
                    "doc": "int: add this number to the quality score (e.g. to convert from Illumina to Sanger, use -31)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outQSconversionAdd"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outQSconversionAdd"
                }, 
                {
                    "doc": "None\nstring: output of unmapped reads (besides SAM)\nNone    ... no output\nFastx   ... output in separate fasta/fastq files, Unmapped.out.mate1/2\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outReadsUnmapped"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outReadsUnmapped"
                }, 
                {
                    "doc": "1\nint>=0:                     start value for the IH attribute. 0 may be required by some downstream software, such as Cufflinks or StringTie.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMattrIHstart"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outSAMattrIHstart"
                }, 
                {
                    "doc": "-\nstring(s): SAM/BAM read group line. The first word contains the read group identifier and must start with \"ID:\", e.g. --outSAMattrRGline ID:xxx CN:yy \"DS:z z z\".\nxxx will be added as RG tag to each output alignment. Any spaces in the tag values have to be double quoted.\nComma separated RG lines correspons to different (comma separated) input files in --readFilesIn. Commas have to be surrounded by spaces, e.g.\n--outSAMattrRGline ID:xxx , ID:zzz \"DS:z z\" , ID:yyy DS:yyyy\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMattrRGline"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outSAMattrRGline"
                }, 
                {
                    "doc": "Standard\nstring: a string of desired SAM attributes, in the order desired for the output SAM\nNH HI AS nM NM MD jM jI XS ... any combination in any order\nStandard   ... NH HI AS nM\nAll        ... NH HI AS nM NM MD jM jI\nNone       ... no attributes\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMattributes"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outSAMattributes"
                }, 
                {
                    "doc": "None\nstring(s): filter the output into main SAM/BAM files\nKeepOnlyAddedReferences ... only keep the reads for which all alignments are to the extra reference sequences added with --genomeFastaFiles at the mapping stage.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMfilter"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outSAMfilter"
                }, 
                {
                    "doc": "65535\nint: 0 to 65535: sam FLAG will be bitwise AND'd with this value, i.e. FLAG=FLAG & outSAMflagOR. This is applied after all flags have been set by STAR, but before outSAMflagOR. Can be used to unset specific bits that are not set otherwise.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMflagAND"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outSAMflagAND"
                }, 
                {
                    "doc": "int: 0 to 65535: sam FLAG will be bitwise OR'd with this value, i.e.\nFLAG=FLAG | outSAMflagOR. This is applied after all flags have been set by\nSTAR, and after outSAMflagAND. Can be used to set specific bits that are\nnot set otherwise.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMflagOR"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outSAMflagOR"
                }, 
                {
                    "doc": "-\nstring: path to the file with @CO (comment) lines of the SAM header\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMheaderCommentFile"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outSAMheaderCommentFile"
                }, 
                {
                    "doc": "-\nstrings: @HD (header) line of the SAM header\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMheaderHD"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/outSAMheaderHD"
                }, 
                {
                    "doc": "-\nstrings: extra @PG (software) line of the SAM header (in addition to STAR)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMheaderPG"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/outSAMheaderPG"
                }, 
                {
                    "doc": "255\nint: 0 to 255: the MAPQ value for unique mappers\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMmapqUnique"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outSAMmapqUnique"
                }, 
                {
                    "default": "Full", 
                    "doc": "string: mode of SAM output\nNone ... no SAM output\nFull ... full SAM output\nNoQS ... full SAM but without quality scores\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMmode"
                    }, 
                    "type": "string", 
                    "id": "#STAR.cwl/outSAMmode"
                }, 
                {
                    "doc": "-1\nint: max number of multiple alignments for a read that will be output to the SAM/BAM files. -1 ... all alignments (up to --outFilterMultimapNmax) will be output\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMmultNmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/outSAMmultNmax"
                }, 
                {
                    "doc": "Paired\nstring: type of sorting for the SAM output\nPaired: one mate after the other for all paired alignments\nPairedKeepInputOrder: one mate after the other for all paired alignments, the order is kept the same as in the input FASTQ files\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMorder"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outSAMorder"
                }, 
                {
                    "doc": "OneBestScore\nstring: which alignments are considered primary - all others will be marked with 0x100 bit in the FLAG\nOneBestScore ... only one alignment with the best score is primary\nAllBestScore ... all alignments with the best score are primary\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMprimaryFlag"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outSAMprimaryFlag"
                }, 
                {
                    "doc": "Standard\nstring: read ID record type\nStandard ... first word (until space) from the FASTx read ID line, removing /1,/2 from the end\nNumber   ... read number (index) in the FASTx file\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMreadID"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outSAMreadID"
                }, 
                {
                    "doc": "None\nstring: Cufflinks-like strand field flag\nNone        ... not used\nintronMotif ... strand derived from the intron motif. Reads with inconsistent and/or non-canonical introns are filtered out.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMstrandField"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outSAMstrandField"
                }, 
                {
                    "default": [
                        "BAM", 
                        "SortedByCoordinate"
                    ], 
                    "doc": "strings: type of SAM/BAM output\n1st word:\nBAM  ... output BAM without sorting\nSAM  ... output SAM without sorting\nNone ... no SAM/BAM output\n2nd, 3rd:\nUnsorted           ... standard unsorted\nSortedByCoordinate ... sorted by coordinate. This option will allocate extra memory for sorting which can be specified by --limitBAMsortRAM.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMtype"
                    }, 
                    "type": {
                        "items": "string", 
                        "type": "array"
                    }, 
                    "id": "#STAR.cwl/outSAMtype"
                }, 
                {
                    "doc": "string: output of unmapped reads in the SAM format\nNone   ... no output\nWithin ... output unmapped reads within the main SAM file (i.e. Aligned.out.sam)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSAMunmapped"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outSAMunmapped"
                }, 
                {
                    "doc": "3   1   1   1 \n4 integers: minimum total (multi-mapping+unique) read count per junction for: (1) non-canonical motifs, (2) GT/AG and CT/AC motif, (3) GC/AG and CT/GC motif, (4) AT/AC and GT/AT motif. -1 means no output for that motif\nJunctions are output if one of outSJfilterCountUniqueMin OR outSJfilterCountTotalMin conditions are satisfied\ndoes not apply to annotated junctions\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSJfilterCountTotalMin"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/outSJfilterCountTotalMin"
                }, 
                {
                    "doc": "3   1   1   1 \n4 integers: minimum uniquely mapping read count per junction for: (1) non-canonical motifs, (2) GT/AG and CT/AC motif, (3) GC/AG and CT/GC motif, (4) AT/AC and GT/AT motif. -1 means no output for that motif\nJunctions are output if one of outSJfilterCountUniqueMin OR outSJfilterCountTotalMin conditions are satisfied\ndoes not apply to annotated junctions\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSJfilterCountUniqueMin"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/outSJfilterCountUniqueMin"
                }, 
                {
                    "doc": "10  0   5   10\n4 integers>=0: minimum allowed distance to other junctions' donor/acceptor\ndoes not apply to annotated junctions\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSJfilterDistToOtherSJmin"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/outSJfilterDistToOtherSJmin"
                }, 
                {
                    "doc": "50000 100000 200000\nN integers>=0: maximum gap allowed for junctions supported by 1,2,3,,,N reads\ni.e. by default junctions supported by 1 read can have gaps <=50000b, by 2 reads: <=100000b, by 3 reads: <=200000. by >=4 reads any gap <=alignIntronMax\ndoes not apply to annotated junctions\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSJfilterIntronMaxVsReadN"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/outSJfilterIntronMaxVsReadN"
                }, 
                {
                    "doc": "30  12  12  12\n4 integers:    minimum overhang length for splice junctions on both sides for: (1) non-canonical motifs, (2) GT/AG and CT/AC motif, (3) GC/AG and CT/GC motif, (4) AT/AC and GT/AT motif. -1 means no output for that motif\ndoes not apply to annotated junctions\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSJfilterOverhangMin"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/outSJfilterOverhangMin"
                }, 
                {
                    "doc": "All\nstring: which reads to consider for collapsed splice junctions output\nAll: all reads, unique- and multi-mappers\nUnique: uniquely mapping reads only\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outSJfilterReads"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outSJfilterReads"
                }, 
                {
                    "default": "Log", 
                    "doc": "Log\nstring: which output will be directed to stdout (standard out)\nLog                    ... log messages\nSAM                    ... alignments in SAM format (which normally are output to Aligned.out.sam file), normal standard output will go into Log.std.out\nBAM_Unsorted           ... alignments in BAM format, unsorted. Requires --outSAMtype BAM Unsorted\nBAM_SortedByCoordinate ... alignments in BAM format, unsorted. Requires --outSAMtype BAM SortedByCoordinate\nBAM_Quant              ... alignments to transcriptome in BAM format, unsorted. Requires --quantMode TranscriptomeSAM\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outStd"
                    }, 
                    "type": "string", 
                    "id": "#STAR.cwl/outStd"
                }, 
                {
                    "doc": "string: path to a directory that will be used as temporary by STAR. All contents of this directory will be removed!\n- the temp directory will default to outFileNamePrefix_STARtmp\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outTmpDir"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outTmpDir"
                }, 
                {
                    "doc": "RPM\nstring: type of normalization for the signal\nRPM    ... reads per million of mapped reads\nNone   ... no normalization, \"raw\" counts\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outWigNorm"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outWigNorm"
                }, 
                {
                    "doc": "string: prefix matching reference names to include in the output wiggle\nfile, e.g. \"chr\", default \"-\" - include all references\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outWigReferencesPrefix"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outWigReferencesPrefix"
                }, 
                {
                    "doc": "Stranded\nstring: strandedness of wiggle/bedGraph output\nStranded   ...  separate strands, str1 and str2\nUnstranded ...  collapsed strands\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outWigStrand"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outWigStrand"
                }, 
                {
                    "doc": "None\nstring(s): type of signal output, e.g. \"bedGraph\" OR \"bedGraph read1_5p\". Requires sorted BAM: --outSAMtype BAM SortedByCoordinate .\n1st word:\nNone       ... no signal output\nbedGraph   ... bedGraph format\nwiggle     ... wiggle format\n2nd word:\nread1_5p   ... signal from only 5' of the 1st read, useful for CAGE/RAMPAGE etc\nread2      ... signal from only 2nd read\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--outWigType"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/outWigType"
                }, 
                {
                    "doc": "string: name of a user-defined parameters file, \"-\": none. Can only be\ndefined on the command line.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--parametersFiles"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/parametersFiles"
                }, 
                {
                    "doc": "-\nstring(s): types of quantification requested\n-                ... none\nTranscriptomeSAM ... output SAM/BAM alignments to transcriptome into a separate file\nGeneCounts       ... count reads per gene\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--quantMode"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/quantMode"
                }, 
                {
                    "doc": "int: -1 to 10  transcriptome BAM compression level, -1=default compression\n(6?), 0=no compression, 10=maximum compression\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--quantTranscriptomeBAMcompression"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/quantTranscriptomeBAMcompression"
                }, 
                {
                    "doc": "IndelSoftclipSingleend\nstring: prohibit various alignment type\nIndelSoftclipSingleend  ... prohibit indels, soft clipping and single-end alignments - compatible with RSEM\nSingleend               ... prohibit single-end alignments\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--quantTranscriptomeBan"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/quantTranscriptomeBan"
                }, 
                {
                    "doc": "string(s): command line to execute for each of the input file. This command should generate FASTA or FASTQ text and send it to stdout\nFor example: zcat - to uncompress .gz files, bzcat - to uncompress .bz2 files, etc.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--readFilesCommand"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/readFilesCommand"
                }, 
                {
                    "doc": "string(s): paths to files that contain input read1 (and, if needed,  read2)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--readFilesIn"
                    }, 
                    "type": [
                        "null", 
                        {
                            "items": "File", 
                            "type": "array"
                        }
                    ], 
                    "id": "#STAR.cwl/readFilesIn"
                }, 
                {
                    "doc": "-1\nint: number of reads to map from the beginning of the file\n-1: map all reads\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--readMapNumber"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/readMapNumber"
                }, 
                {
                    "doc": "string: Equal/NotEqual - lengths of names,sequences,qualities for both\nmates are the same  / not the same. NotEqual is safe in all situations.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--readMatesLengthsIn"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/readMatesLengthsIn"
                }, 
                {
                    "doc": "/\nstring(s): character(s) separating the part of the read names that will be\ntrimmed in output (read name after space is always trimmed)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--readNameSeparator"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/readNameSeparator"
                }, 
                {
                    "doc": "User_RWX\nstring: permissions for the directories created at the run-time.\nUser_RWX ... user-read/write/execute\nAll_RWX  ... all-read/write/execute (same as chmod 777)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--runDirPerm"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/runDirPerm"
                }, 
                {
                    "default": "alignReads", 
                    "doc": "string: type of the run:\nalignReads             ... map reads\ngenomeGenerate         ... generate genome files\ninputAlignmentsFromBAM ... input alignments from BAM. Presently only works with --outWigType and --bamRemoveDuplicates.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--runMode"
                    }, 
                    "type": "string", 
                    "id": "#STAR.cwl/runMode"
                }, 
                {
                    "doc": "777\nint: random number generator seed.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--runRNGseed"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/runRNGseed"
                }, 
                {
                    "doc": "1\nint: number of threads to run STAR\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--runThreadN"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/runThreadN"
                }, 
                {
                    "doc": "-2\ndeletion extension penalty per base (in addition to scoreDelOpen)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreDelBase"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/scoreDelBase"
                }, 
                {
                    "doc": "-2\ndeletion open penalty\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreDelOpen"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/scoreDelOpen"
                }, 
                {
                    "doc": "0\nint: splice junction penalty (independent on intron motif)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreGap"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/scoreGap"
                }, 
                {
                    "doc": "-8\nAT/AC  and GT/AT junction penalty  (in addition to scoreGap)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreGapATAC"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/scoreGapATAC"
                }, 
                {
                    "doc": "-4\nGC/AG and CT/GC junction penalty (in addition to scoreGap)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreGapGCAG"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/scoreGapGCAG"
                }, 
                {
                    "doc": "-8\nint: non-canonical junction penalty (in addition to scoreGap)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreGapNoncan"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/scoreGapNoncan"
                }, 
                {
                    "doc": "-0.25\nextra score logarithmically scaled with genomic length of the alignment: scoreGenomicLengthLog2scale*log2(genomicLength)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreGenomicLengthLog2scale"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/scoreGenomicLengthLog2scale"
                }, 
                {
                    "doc": "-2\ninsertion extension penalty per base (in addition to scoreInsOpen)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreInsBase"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/scoreInsBase"
                }, 
                {
                    "doc": "-2\ninsertion open penalty\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreInsOpen"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/scoreInsOpen"
                }, 
                {
                    "doc": "1\nmaximum score reduction while searching for SJ boundaries inthe stitching step\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--scoreStitchSJshift"
                    }, 
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "id": "#STAR.cwl/scoreStitchSJshift"
                }, 
                {
                    "doc": "10000\nint>0: only pieces that map fewer than this value are utilized in the stitching procedure\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedMultimapNmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/seedMultimapNmax"
                }, 
                {
                    "doc": "10 \nint>0: max number of one seed loci per window\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedNoneLociPerWindow"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/seedNoneLociPerWindow"
                }, 
                {
                    "doc": "1000\nint>0: max number of seeds per read\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedPerReadNmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/seedPerReadNmax"
                }, 
                {
                    "doc": "50\nint>0: max number of seeds per window\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedPerWindowNmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/seedPerWindowNmax"
                }, 
                {
                    "doc": "0\nint>=0: defines the maximum length of the seeds, if =0 max seed lengthis infinite\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedSearchLmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/seedSearchLmax"
                }, 
                {
                    "doc": "50\nint>0: defines the search start point through the read - the read is split into pieces no longer than this value\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedSearchStartLmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/seedSearchStartLmax"
                }, 
                {
                    "doc": "1.0\nfloat: seedSearchStartLmax normalized to read length (sum of mates' lengths for paired-end reads)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--seedSearchStartLmaxOverLread"
                    }, 
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "id": "#STAR.cwl/seedSearchStartLmaxOverLread"
                }, 
                {
                    "doc": "-\nstring(s): path to the files with genomic coordinates (chr <tab> start <tab> end <tab> strand) for the splice junction introns. Multiple files can be supplied wand will be concatenated.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbFileChrStartEnd"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/sjdbFileChrStartEnd"
                }, 
                {
                    "doc": "string: prefix for chromosome names in a GTF file (e.g. 'chr' for using\nENSMEBL annotations with UCSC geneomes)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbGTFchrPrefix"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/sjdbGTFchrPrefix"
                }, 
                {
                    "doc": "exon\nstring: feature type in GTF file to be used as exons for building\ntranscripts\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbGTFfeatureExon"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/sjdbGTFfeatureExon"
                }, 
                {
                    "doc": "string: path to the GTF file with annotations\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbGTFfile"
                    }, 
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "id": "#STAR.cwl/sjdbGTFfile"
                }, 
                {
                    "doc": "gene_id\nstring: tag name to be used as exons' gene-parents (default \"gene_id\" works for GTF files)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbGTFtagExonParentGene"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/sjdbGTFtagExonParentGene"
                }, 
                {
                    "doc": "transcript_id\nstring: tag name to be used as exons' transcript-parents (default\n\"transcript_id\" works for GTF files)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbGTFtagExonParentTranscript"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/sjdbGTFtagExonParentTranscript"
                }, 
                {
                    "doc": "Basic\nstring: which files to save when sjdb junctions are inserted on the fly at the mapping step\nBasic ... only small junction / transcript files\nAll   ... all files including big Genome, SA and SAindex - this will create a complete genome directory\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbInsertSave"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/sjdbInsertSave"
                }, 
                {
                    "doc": "100\nint>0: length of the donor/acceptor sequence on each side of the junctions, ideally = (mate_length - 1)\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbOverhang"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/sjdbOverhang"
                }, 
                {
                    "doc": "2\nint: extra alignment score for alignmets that cross database junctions\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sjdbScore"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/sjdbScore"
                }, 
                {
                    "doc": "string: path to the shell binary, preferrably bash, e.g. /bin/bash.\n- ... the default shell is executed, typically /bin/sh. This was reported to fail on some Ubuntu systems - then you need to specify path to bash.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--sysShell"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/sysShell"
                }, 
                {
                    "doc": "int: number of reads to process for the 1st step. Use very large number (or\ndefault -1) to map all reads in the first step.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--twopass1readsN"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/twopass1readsN"
                }, 
                {
                    "doc": "None\nstring: 2-pass mapping mode.\nNone        ... 1-pass mapping\nBasic       ... basic 2-pass mapping, with all 1st pass junctions inserted into the genome indices on the fly\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--twopassMode"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/twopassMode"
                }, 
                {
                    "doc": "9\nint>0: max number of bins between two anchors that allows aggregation of anchors into one window\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--winAnchorDistNbins"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/winAnchorDistNbins"
                }, 
                {
                    "doc": "50\nint>0: max number of loci anchors are allowed to map to\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--winAnchorMultimapNmax"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/winAnchorMultimapNmax"
                }, 
                {
                    "doc": "16\nint>0: =log2(winBin), where winBin is the size of the bin for the windows/clustering, each window will occupy an integer number of bins.\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--winBinNbits"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/winBinNbits"
                }, 
                {
                    "doc": "4\nint>0: log2(winFlank), where win Flank is the size of the left and right flanking regions for each window\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--winFlankNbins"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#STAR.cwl/winFlankNbins"
                }
            ], 
            "requirements": [
                {
                    "envDef": [
                        {
                            "envName": "PATH", 
                            "envValue": "/usr/local/bin/:/usr/bin:/bin"
                        }
                    ], 
                    "id": "file:///home/ubuntu/bespin-cwl/community-workflows/tools/envvar-global.yml", 
                    "name": "file:///home/ubuntu/bespin-cwl/community-workflows/tools/envvar-global.yml", 
                    "class": "EnvVarRequirement"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "http://schema.org/downloadUrl": "https://github.com/common-workflow-language/workflows/blob/master/tools/STAR.cwl", 
            "http://schema.org/codeRepository": "https://github.com/common-workflow-language/workflows", 
            "outputs": [
                {
                    "outputBinding": {
                        "glob": "${\n  if (inputs.runMode == \"genomeGenerate\")\n    return [];\n\n  var p = inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\";\n  if (inputs.outSAMtype.indexOf(\"SAM\") > -1) {\n      return p+\"Aligned.out.sam\";\n  } else {\n   if ( inputs.outSAMtype.indexOf(\"SortedByCoordinate\") > -1 )\n      return p+\"Aligned.sortedByCoord.out.bam\";\n    else\n      return p+\"Aligned.out.bam\";\n  }\n}\n"
                    }, 
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "id": "#STAR.cwl/aligned"
                }, 
                {
                    "outputBinding": {
                        "glob": "${\n  if (inputs.runMode != \"genomeGenerate\")\n    return [];\n  return inputs.genomeDir;\n}\n"
                    }, 
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "id": "#STAR.cwl/indices"
                }, 
                {
                    "outputBinding": {
                        "glob": "${\n    var p = inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\";\n    return [p + \"Log.final.out\", p + \"SJ.out.tab\", p + \"Log.out\"];\n  }\n"
                    }, 
                    "type": [
                        "null", 
                        {
                            "items": "File", 
                            "type": "array"
                        }
                    ], 
                    "id": "#STAR.cwl/logs"
                }, 
                {
                    "outputBinding": {
                        "glob": "${\n  if (inputs.runMode == \"genomeGenerate\")\n    return [];\n\n  var p = inputs.outFileNamePrefix?inputs.outFileNamePrefix:\"\";\n  return p+\"Log.final.out\";\n}\n", 
                        "loadContents": true, 
                        "outputEval": "${\n  if (inputs.runMode == \"genomeGenerate\")\n    return \"\";\n\n  var s = self[0].contents.replace(/[ ]+.*?:\\n|[ ]{2,}|\\n$/g,\"\").\n      split(/\\n{1,2}/g).map(function(v){var s=v.split(/\\|\\t/g); var o={}; o[s[0]]=s[1]; return o;})\n  return JSON.stringify(s);\n}\n"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#STAR.cwl/mappingstats"
                }
            ], 
            "http://schema.org/mainEntity": {
                "http://schema.org/targetProduct": {
                    "http://schema.org/softwareVersion": "2.5.0b", 
                    "class": "http://schema.org/SoftwareApplication", 
                    "http://schema.org/applicationCategory": "commandline tool"
                }, 
                "http://schema.org/codeRepository": "https://github.com/alexdobin/STAR.git", 
                "http://schema.org/about": "Aligns RNA-seq reads to a reference genome using uncompressed suffix arrays. STAR has a potential for accurately aligning long (several kilobases) reads that are emerging from the third-generation sequencing technologies.\n", 
                "http://schema.org/publication": [
                    {
                        "class": "http://schema.org/ScholarlyArticle", 
                        "id": "http://dx.doi.org/10.1093/bioinformatics/bts635"
                    }
                ], 
                "http://schema.org/name": "STAR", 
                "http://schema.org/license": [
                    "https://opensource.org/licenses/GPL-3.0"
                ], 
                "http://schema.org/author": [
                    {
                        "http://schema.org/worksFor": [
                            {
                                "class": "http://schema.org/Organization", 
                                "http://schema.org/name": "Cold Spring Harbor Laboratory, Cold Spring Harbor, NY, USA"
                            }
                        ], 
                        "class": "http://schema.org/Person", 
                        "http://schema.org/email": "mailto:dobin@cshl.edu", 
                        "id": "mailto:dobin@cshl.edu", 
                        "http://schema.org/name": "Alexander Dobin"
                    }
                ], 
                "http://schema.org/programmingLanguage": "C++", 
                "class": "http://schema.org/SoftwareSourceCode", 
                "http://schema.org/url": "https://github.com/alexdobin/STAR"
            }, 
            "$schemas": [
                "http://schema.org/docs/schema_org_rdfa.html"
            ], 
            "baseCommand": [
                "STAR"
            ], 
            "id": "#STAR.cwl", 
            "class": "CommandLineTool", 
            "http://schema.org/author": {
                "http://schema.org/worksFor": [
                    {
                        "http://schema.org/name": "Cincinnati Children's Hospital Medical Center", 
                        "class": "http://schema.org/Organization", 
                        "http://schema.org/department": [
                            {
                                "class": "http://schema.org/Organization", 
                                "http://schema.org/name": "Barski Lab"
                            }
                        ], 
                        "http://schema.org/location": "3333 Burnet Ave, Cincinnati, OH 45229-3026"
                    }
                ], 
                "http://schema.org/name": "Andrey Kartashov", 
                "class": "http://schema.org/Person", 
                "http://schema.org/sameAs": [
                    {
                        "id": "http://orcid.org/0000-0001-9102-5681"
                    }
                ], 
                "http://schema.org/email": "mailto:Andrey.Kartashov@cchmc.org"
            }, 
            "$namespaces": {
                "s": "http://schema.org/"
            }, 
            "http://schema.org/isPartOf": {
                "class": "http://schema.org/CreativeWork", 
                "http://schema.org/url": "http://commonwl.org/", 
                "http://schema.org/name": "Common Workflow Language"
            }, 
            "hints": [
                {
                    "dockerPull": "scidap/star:v2.5.0b", 
                    "dockerFile": "$import: STAR-Dockerfile\n", 
                    "class": "DockerRequirement"
                }
            ]
        }, 
        {
            "inputs": [
                {
                    "default": false, 
                    "doc": "Generate BAI-format index for BAM files [default]\n", 
                    "type": "boolean", 
                    "id": "#samtools-index.cwl/bai"
                }, 
                {
                    "default": false, 
                    "doc": "Generate CSI-format index for BAM files\n", 
                    "type": "boolean", 
                    "id": "#samtools-index.cwl/csi"
                }, 
                {
                    "doc": "Input bam file.\n", 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "type": "File", 
                    "id": "#samtools-index.cwl/input"
                }, 
                {
                    "doc": "Set minimum interval size for CSI indices to 2^INT [14]\n", 
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-m"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#samtools-index.cwl/interval"
                }
            ], 
            "requirements": [
                {
                    "envDef": [
                        {
                            "envName": "PATH", 
                            "envValue": "/usr/local/bin/:/usr/bin:/bin"
                        }
                    ], 
                    "id": "file:///home/ubuntu/bespin-cwl/community-workflows/tools/envvar-global.yml", 
                    "name": "file:///home/ubuntu/bespin-cwl/community-workflows/tools/envvar-global.yml", 
                    "class": "EnvVarRequirement"
                }, 
                {
                    "dockerPull": "scidap/samtools:v1.2-242-4d56437", 
                    "dockerFile": "$import: samtools-Dockerfile\n", 
                    "id": "file:///home/ubuntu/bespin-cwl/community-workflows/tools/samtools-docker.yml", 
                    "name": "file:///home/ubuntu/bespin-cwl/community-workflows/tools/samtools-docker.yml", 
                    "class": "DockerRequirement"
                }, 
                {
                    "class": "InlineJavascriptRequirement", 
                    "expressionLib": [
                        "var new_ext = function() { var ext=inputs.bai?'.bai':inputs.csi?'.csi':'.bai'; return inputs.input.path.split('/').slice(-1)[0]+ext; };"
                    ]
                }
            ], 
            "http://schema.org/downloadUrl": "https://github.com/common-workflow-language/workflows/blob/master/tools/samtools-index.cwl", 
            "http://schema.org/codeRepository": "https://github.com/common-workflow-language/workflows", 
            "outputs": [
                {
                    "doc": "The index file", 
                    "outputBinding": {
                        "glob": "$(new_ext())"
                    }, 
                    "type": "File", 
                    "id": "#samtools-index.cwl/index"
                }
            ], 
            "http://schema.org/mainEntity": {
                "name": "file:///home/ubuntu/bespin-cwl/community-workflows/tools/samtools-metadata.yaml", 
                "http://schema.org/targetProduct": {
                    "http://schema.org/softwareVersion": "1.2-242-4d56437", 
                    "class": "http://schema.org/SoftwareApplication", 
                    "http://schema.org/applicationCategory": "commandline tool"
                }, 
                "http://schema.org/codeRepository": "https://github.com/samtools/samtools.git", 
                "id": "file:///home/ubuntu/bespin-cwl/community-workflows/tools/samtools-metadata.yaml", 
                "http://schema.org/about": "A suite of programs for interacting with high-throughput sequencing data. It consists of three separate repositories: Samtools (Reading/writing/editing/indexing/viewing SAM/BAM/CRAM format), BCFtools (Reading/writing BCF2/VCF/gVCF files and calling/filtering/summarising SNP and short indel sequence variants) and HTSlib (A C library for reading/writing high-throughput sequencing data).\n", 
                "http://schema.org/publication": [
                    {
                        "class": "http://schema.org/ScholarlyArticle", 
                        "id": "http://dx.doi.org/10.1093/bioinformatics/btr509", 
                        "http://schema.org/url": "http://www.ncbi.nlm.nih.gov/pubmed/21903627", 
                        "http://schema.org/name": "(Li, 2011) A statistical framework for SNP calling, mutation discovery, association mapping and population genetical parameter estimation from sequencing data. Bioinformatics."
                    }, 
                    {
                        "class": "http://schema.org/ScholarlyArticle", 
                        "id": "http://dx.doi.org/10.1093/bioinformatics/btr076", 
                        "http://schema.org/url": "http://www.ncbi.nlm.nih.gov/pubmed/21320865", 
                        "http://schema.org/name": "(Li, 2011) Improving SNP discovery by base alignment quality. Bioinformatics."
                    }, 
                    {
                        "class": "http://schema.org/ScholarlyArticle", 
                        "id": "http://dx.doi.org/10.1093/bioinformatics/btp352", 
                        "http://schema.org/url": "http://www.ncbi.nlm.nih.gov/pubmed/19505943", 
                        "http://schema.org/name": "(Li et al., 2009) The Sequence Alignment/Map format and SAMtools. Bioinformatics."
                    }
                ], 
                "http://schema.org/discussionUrl": [
                    "https://lists.sourceforge.net/lists/listinfo/samtools-help", 
                    "https://lists.sourceforge.net/lists/listinfo/samtools-devel"
                ], 
                "http://schema.org/name": "samtools", 
                "http://schema.org/license": [
                    "https://opensource.org/licenses/MIT", 
                    "https://opensource.org/licenses/BSD-3-Clause"
                ], 
                "http://schema.org/creator": [
                    {
                        "class": "http://schema.org/Organization", 
                        "http://schema.org/member": [
                            {
                                "http://schema.org/description": "wrote most of the initial source codes of SAMtools and various converters.", 
                                "class": "http://schema.org/Person", 
                                "http://schema.org/name": "Heng Li"
                            }
                        ], 
                        "http://schema.org/name": "Sanger Institute"
                    }, 
                    {
                        "class": "http://schema.org/Organization", 
                        "http://schema.org/member": [
                            {
                                "http://schema.org/description": "A major contributor to the\nSAM/BAM specification. He designed and implemented the BGZF format, the\nunderlying indexable compression format for the BAM format. BGZF does\nnot support arithmetic between file offsets.\n", 
                                "class": "http://schema.org/Person", 
                                "http://schema.org/name": "Bob Handsaker"
                            }
                        ], 
                        "http://schema.org/name": "Broad Institute"
                    }, 
                    {
                        "class": "http://schema.org/Organization", 
                        "http://schema.org/member": [
                            {
                                "http://schema.org/description": "Designed and implemented the\nRAZF format, an alternative indexable compression format. RAZF is no longer\nused by or provided with SAMtools. Source code remains available in older\nSAMtools 0.1.x releases and from the standalone branch in the repository.\n", 
                                "class": "http://schema.org/Person", 
                                "http://schema.org/name": "Jue Ruan"
                            }
                        ], 
                        "http://schema.org/name": "Beijing Genome Institute"
                    }, 
                    {
                        "http://schema.org/description": "updated novo2sam.pl to support gapped alignment by novoalign.", 
                        "class": "http://schema.org/Person", 
                        "http://schema.org/name": "Colin Hercus"
                    }, 
                    {
                        "http://schema.org/description": "contributed the header parsing library sam_header.c and sam2vcf.pl script.", 
                        "class": "http://schema.org/Person", 
                        "http://schema.org/name": "Petr Danecek"
                    }
                ], 
                "http://schema.org/programmingLanguage": "C, Perl", 
                "class": "http://schema.org/SoftwareSourceCode", 
                "http://schema.org/url": "http://www.htslib.org/"
            }, 
            "$schemas": [
                "http://schema.org/docs/schema_org_rdfa.html"
            ], 
            "baseCommand": [
                "samtools", 
                "index"
            ], 
            "id": "#samtools-index.cwl", 
            "http://schema.org/isPartOf": {
                "class": "http://schema.org/CreativeWork", 
                "http://schema.org/url": "http://commonwl.org/", 
                "http://schema.org/name": "Common Workflow Language"
            }, 
            "arguments": [
                {
                    "position": 1, 
                    "valueFrom": "$(inputs.bai?'-b':inputs.csi?'-c':[])"
                }, 
                {
                    "position": 3, 
                    "valueFrom": "$(new_ext())"
                }
            ], 
            "doc": "samtools-index.cwl is developed for CWL consortium\n", 
            "http://schema.org/license": "http://www.apache.org/licenses/LICENSE-2.0", 
            "http://schema.org/author": {
                "http://schema.org/worksFor": [
                    {
                        "http://schema.org/name": "Cincinnati Children's Hospital Medical Center", 
                        "class": "http://schema.org/Organization", 
                        "http://schema.org/department": [
                            {
                                "class": "http://schema.org/Organization", 
                                "http://schema.org/name": "Barski Lab"
                            }
                        ], 
                        "http://schema.org/location": "3333 Burnet Ave, Cincinnati, OH 45229-3026"
                    }
                ], 
                "http://schema.org/name": "Andrey Kartashov", 
                "class": "http://schema.org/Person", 
                "http://schema.org/sameAs": [
                    {
                        "id": "http://orcid.org/0000-0001-9102-5681"
                    }
                ], 
                "http://schema.org/email": "mailto:Andrey.Kartashov@cchmc.org"
            }, 
            "$namespaces": {
                "s": "http://schema.org/"
            }, 
            "class": "CommandLineTool"
        }, 
        {
            "inputs": [
                {
                    "default": "fastq", 
                    "inputBinding": {
                        "position": 3, 
                        "prefix": "--format"
                    }, 
                    "type": "string", 
                    "id": "#fastqc.cwl/format"
                }, 
                {
                    "inputBinding": {
                        "position": 4
                    }, 
                    "type": "File", 
                    "id": "#fastqc.cwl/input_fastq_file"
                }, 
                {
                    "default": true, 
                    "inputBinding": {
                        "position": 2, 
                        "prefix": "--noextract"
                    }, 
                    "type": "boolean", 
                    "id": "#fastqc.cwl/noextract"
                }, 
                {
                    "default": 1, 
                    "inputBinding": {
                        "position": 5, 
                        "prefix": "--threads"
                    }, 
                    "type": "int", 
                    "id": "#fastqc.cwl/threads"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "outputs": [
                {
                    "outputBinding": {
                        "glob": "$(inputs.input_fastq_file.path.replace(/^.*[\\\\\\/]/, \"\").replace(/\\.[^/.]+$/, '') + \"_fastqc.zip\")"
                    }, 
                    "type": "File", 
                    "id": "#fastqc.cwl/output_qc_report"
                }
            ], 
            "baseCommand": "fastqc", 
            "class": "CommandLineTool", 
            "arguments": [
                {
                    "position": 5, 
                    "valueFrom": "$('/tmp')", 
                    "prefix": "--dir"
                }, 
                {
                    "position": 5, 
                    "valueFrom": "$(runtime.outdir)", 
                    "prefix": "-o"
                }
            ], 
            "id": "#fastqc.cwl", 
            "hints": [
                {
                    "dockerPull": "dukegcb/fastqc", 
                    "class": "DockerRequirement"
                }
            ]
        }, 
        {
            "inputs": [
                {
                    "inputBinding": {
                        "position": 2
                    }, 
                    "type": "File", 
                    "id": "#htseq-count.cwl/alignment_file", 
                    "label": ""
                }, 
                {
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-t"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#htseq-count.cwl/featuretype", 
                    "label": "feature type (3rd column in GFF file) to be used, all features of other type are ignored (default, suitable for Ensembl GTF files: exon)"
                }, 
                {
                    "inputBinding": {
                        "position": 3
                    }, 
                    "type": "File", 
                    "id": "#htseq-count.cwl/gff_file", 
                    "label": ""
                }, 
                {
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-i"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#htseq-count.cwl/idattr", 
                    "label": "GFF attribute to be used as feature ID (default, suitable for Ensembl GTF files: gene_id)"
                }, 
                {
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-a"
                    }, 
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "id": "#htseq-count.cwl/minaqual", 
                    "label": ""
                }, 
                {
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-m"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#htseq-count.cwl/mode", 
                    "label": ""
                }, 
                {
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-r"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#htseq-count.cwl/order", 
                    "label": ""
                }, 
                {
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-o"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#htseq-count.cwl/samout", 
                    "label": ""
                }, 
                {
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-f"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#htseq-count.cwl/samtype", 
                    "label": ""
                }, 
                {
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "-s"
                    }, 
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "id": "#htseq-count.cwl/stranded", 
                    "label": ""
                }
            ], 
            "stdout": "htseq-count.txt", 
            "outputs": [
                {
                    "type": "stdout", 
                    "id": "#htseq-count.cwl/output"
                }
            ], 
            "baseCommand": [
                "htseq-count"
            ], 
            "class": "CommandLineTool", 
            "id": "#htseq-count.cwl", 
            "hints": [
                {
                    "dockerPull": "quay.io/dukegcb/htseq", 
                    "dockerFile": "$import: HTSeq/Dockerfile\n", 
                    "class": "DockerRequirement"
                }
            ]
        }, 
        {
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
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "id": "#merge-secondary-file.cwl/merged"
                }
            ], 
            "id": "#merge-secondary-file.cwl", 
            "expression": "${\n  var ret = inputs.primary;\n  ret[\"secondaryFiles\"] = [inputs.secondary];\n  return {\"merged\": ret };\n}\n", 
            "class": "ExpressionTool"
        }, 
        {
            "inputs": [
                {
                    "inputBinding": {
                        "prefix": "-i"
                    }, 
                    "type": "File", 
                    "id": "#read_distribution.cwl/input", 
                    "label": "Alignment file in BAM or SAM format"
                }, 
                {
                    "inputBinding": {
                        "prefix": "-r"
                    }, 
                    "type": "File", 
                    "id": "#read_distribution.cwl/ref_gene_model", 
                    "label": "Reference gene model in bed format"
                }
            ], 
            "stdout": "read_distribution.txt", 
            "outputs": [
                {
                    "type": "stdout", 
                    "id": "#read_distribution.cwl/output"
                }
            ], 
            "baseCommand": [
                "read_distribution.py"
            ], 
            "class": "CommandLineTool", 
            "id": "#read_distribution.cwl", 
            "hints": [
                {
                    "dockerPull": "quay.io/dukegcb/rseqc", 
                    "dockerFile": "$import RSeQC/Dockerfile\n", 
                    "class": "DockerRequirement"
                }
            ]
        }, 
        {
            "inputs": [
                {
                    "inputBinding": {
                        "position": 1, 
                        "prefix": "--paired"
                    }, 
                    "type": "boolean", 
                    "id": "#trim_galore.cwl/paired"
                }, 
                {
                    "inputBinding": {
                        "position": 3
                    }, 
                    "type": {
                        "items": "File", 
                        "type": "array"
                    }, 
                    "id": "#trim_galore.cwl/reads"
                }
            ], 
            "outputs": [
                {
                    "outputBinding": {
                        "glob": "*_trimming_report.txt"
                    }, 
                    "type": {
                        "items": "File", 
                        "type": "array"
                    }, 
                    "id": "#trim_galore.cwl/trim_reports"
                }, 
                {
                    "outputBinding": {
                        "glob": "*_val_*.fq"
                    }, 
                    "type": {
                        "items": "File", 
                        "type": "array"
                    }, 
                    "id": "#trim_galore.cwl/trimmed_reads"
                }
            ], 
            "baseCommand": "trim_galore", 
            "class": "CommandLineTool", 
            "arguments": [
                {
                    "position": 2, 
                    "valueFrom": "$(runtime.outdir)", 
                    "prefix": "-o"
                }
            ], 
            "id": "#trim_galore.cwl", 
            "hints": [
                {
                    "dockerPull": "miasteinberg/trim-galore", 
                    "class": "DockerRequirement"
                }
            ]
        }, 
        {
            "inputs": [
                {
                    "type": "string", 
                    "id": "#main/align_out_prefix"
                }, 
                {
                    "type": "File", 
                    "id": "#main/gff_file"
                }, 
                {
                    "type": {
                        "items": "File", 
                        "type": "array"
                    }, 
                    "id": "#main/reads"
                }, 
                {
                    "type": "File", 
                    "id": "#main/ref_gene_model"
                }, 
                {
                    "type": "Directory", 
                    "id": "#main/star_genome"
                }, 
                {
                    "type": "int", 
                    "id": "#main/threads"
                }
            ], 
            "requirements": [
                {
                    "class": "ScatterFeatureRequirement"
                }
            ], 
            "outputs": [
                {
                    "outputSource": "#main/align/logs", 
                    "type": {
                        "items": "File", 
                        "type": "array"
                    }, 
                    "id": "#main/align_logs"
                }, 
                {
                    "outputSource": "#main/align/aligned", 
                    "type": "File", 
                    "id": "#main/aligned_read"
                }, 
                {
                    "outputSource": "#main/index/index", 
                    "type": "File", 
                    "id": "#main/aligned_read_index"
                }, 
                {
                    "outputSource": "#main/qc/output_qc_report", 
                    "type": {
                        "items": "File", 
                        "type": "array"
                    }, 
                    "id": "#main/qc_reports"
                }, 
                {
                    "outputSource": "#main/quantification/output", 
                    "type": "File", 
                    "id": "#main/quantification_report"
                }, 
                {
                    "outputSource": "#main/read_distribution/output", 
                    "type": "File", 
                    "id": "#main/read_distribution_report"
                }, 
                {
                    "outputSource": "#main/trim/trim_reports", 
                    "type": {
                        "items": "File", 
                        "type": "array"
                    }, 
                    "id": "#main/trim_reports"
                }, 
                {
                    "outputSource": "#main/trim/trimmed_reads", 
                    "type": {
                        "items": "File", 
                        "type": "array"
                    }, 
                    "id": "#main/trimmed_reads"
                }
            ], 
            "id": "#main", 
            "steps": [
                {
                    "out": [
                        "#main/align/aligned", 
                        "#main/align/logs"
                    ], 
                    "run": "#STAR.cwl", 
                    "id": "#main/align", 
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
                    ]
                }, 
                {
                    "out": [
                        "#main/index/index"
                    ], 
                    "run": "#samtools-index.cwl", 
                    "id": "#main/index", 
                    "in": [
                        {
                            "default": true, 
                            "id": "#main/index/bai"
                        }, 
                        {
                            "source": "#main/align/aligned", 
                            "id": "#main/index/input"
                        }
                    ]
                }, 
                {
                    "out": [
                        "#main/merge_index/merged"
                    ], 
                    "run": "#merge-secondary-file.cwl", 
                    "id": "#main/merge_index", 
                    "in": [
                        {
                            "source": "#main/align/aligned", 
                            "id": "#main/merge_index/primary"
                        }, 
                        {
                            "source": "#main/index/index", 
                            "id": "#main/merge_index/secondary"
                        }
                    ]
                }, 
                {
                    "scatter": "#main/qc/input_fastq_file", 
                    "out": [
                        "#main/qc/output_qc_report"
                    ], 
                    "run": "#fastqc.cwl", 
                    "id": "#main/qc", 
                    "in": [
                        {
                            "source": "#main/reads", 
                            "id": "#main/qc/input_fastq_file"
                        }, 
                        {
                            "source": "#main/threads", 
                            "id": "#main/qc/threads"
                        }
                    ]
                }, 
                {
                    "out": [
                        "#main/quantification/output"
                    ], 
                    "run": "#htseq-count.cwl", 
                    "id": "#main/quantification", 
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
                    ]
                }, 
                {
                    "out": [
                        "#main/read_distribution/output"
                    ], 
                    "run": "#read_distribution.cwl", 
                    "id": "#main/read_distribution", 
                    "in": [
                        {
                            "source": "#main/merge_index/merged", 
                            "id": "#main/read_distribution/input"
                        }, 
                        {
                            "source": "#main/ref_gene_model", 
                            "id": "#main/read_distribution/ref_gene_model"
                        }
                    ]
                }, 
                {
                    "out": [
                        "#main/trim/trimmed_reads", 
                        "#main/trim/trim_reports"
                    ], 
                    "run": "#trim_galore.cwl", 
                    "id": "#main/trim", 
                    "in": [
                        {
                            "default": true, 
                            "id": "#main/trim/paired"
                        }, 
                        {
                            "source": "#main/reads", 
                            "id": "#main/trim/reads"
                        }
                    ]
                }
            ], 
            "class": "Workflow"
        }
    ]
}