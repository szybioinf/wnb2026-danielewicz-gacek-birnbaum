grep -c '^##' final.vcf
4

grep -vc '^#' final.vcf
1543

awk -F'\t' '!/^#/ { print NF }' final.vcf | sort -u
103

grep -v '^#' final.vcf | cut -f3 | sort | uniq -d | wc -l
0

bcftools view final.vcf > /dev/null && echo "Plik poprawny formalnie"
[W::vcf_parse] Contig 'CM007361.1' is not defined in the header. (Quick workaround: index the file with tabix.)
(…)
[W::vcf_parse] Contig 'MLAU01054502.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
Plik poprawny formalnie

bcftools stats final.vcf | head -40
[W::vcf_parse] Contig 'CM007361.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007362.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007363.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007364.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007365.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007366.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007367.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007368.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007369.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007370.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007371.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007372.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007373.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007374.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007375.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007376.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007377.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007378.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007379.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007380.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862195.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862197.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862199.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862200.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862201.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862205.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862238.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862244.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862246.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862266.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862282.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862288.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862298.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862300.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862303.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862321.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862322.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862339.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862369.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'KV862383.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01000400.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01000730.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01000738.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01000805.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01000814.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01000820.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01000971.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01001074.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01001314.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01003310.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01003439.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01003699.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01003731.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01003743.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01003745.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01003849.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01004541.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01004926.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01005450.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01005551.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01005815.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01005838.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01007206.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01007327.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01007381.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01007448.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01007901.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01007902.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01007912.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01007990.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01009271.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01009579.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01011364.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01011551.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01011713.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01013697.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01013700.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01014466.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01014597.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01014661.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01014870.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01015933.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01016089.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01016107.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01017600.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01017610.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01017685.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01017695.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01017779.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01017782.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01018345.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01018494.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01018603.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01020105.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01020432.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01020489.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01020638.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01021750.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01021756.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01022083.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01022087.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01022158.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01025044.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01026013.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01026156.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01026738.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01027940.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01028146.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01028350.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01028351.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01028403.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01030634.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01032244.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01032245.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01034191.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01034454.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01034899.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01034903.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01037440.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01037455.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01037689.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01039106.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01039873.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01052363.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01052647.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'MLAU01054502.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
# This file was produced by bcftools stats (1.25+htslib-1.25) and can be plotted using plot-vcfstats.
# The command line was: bcftools stats  final.vcf
#
# Definition of sets:
# ID    [2]id   [3]tab-separated file names
ID      0       final.vcf
# SN, Summary numbers:
#   number of records   .. number of data rows in the VCF
#   number of no-ALTs   .. reference-only sites, ALT is either "." or identical to REF
#   number of SNPs      .. number of rows with a SNP
#   number of MNPs      .. number of rows with a MNP, such as CC>TT
#   number of indels    .. number of rows with an indel
#   number of others    .. number of rows with other type, for example a symbolic allele or
#                          a complex substitution, such as ACT>TCGA
#   number of multiallelic sites     .. number of rows with multiple alternate alleles
#   number of multiallelic SNP sites .. number of rows with multiple alternate alleles, all SNPs
#
#   Note that rows containing multiple types will be counted multiple times, in each
#   counter. For example, a row with a SNP and an indel increments both the SNP and
#   the indel counter.
#
# SN    [2]id   [3]key  [4]value
SN      0       number of samples:      94
SN      0       number of records:      1543
SN      0       number of no-ALTs:      0
SN      0       number of SNPs: 1543
SN      0       number of MNPs: 0
SN      0       number of indels:       0
SN      0       number of others:       0
SN      0       number of multiallelic sites:   0
SN      0       number of multiallelic SNP sites:       0
# TSTV, transitions/transversions
#   - transitions, see https://en.wikipedia.org/wiki/Transition_(genetics)
#   - transversions, see https://en.wikipedia.org/wiki/Transversion
# TSTV  [2]id   [3]ts   [4]tv   [5]ts/tv        [6]ts (1st ALT)     [7]tv (1st ALT) [8]ts/tv (1st ALT)
TSTV    0       971     572     1.70    971     572     1.70
# SiS, Singleton stats:
#   - allele count, i.e. the number of singleton genotypes (AC=1)
#   - number of transitions, see above
#   - number of transversions, see above

samtools faidx blok3/genome.fa

paste <(tail -n +2 step2_core_rc.tsv | cut -f1-5) zasady.txt \
| awk -F'\t' '
	{
	 g = toupper($6)
	 r = toupper($4)
	 a = toupper($5)
	 if (g == r) eq_ref++
	 else if (g == a) eq_alt++
	 else poza++
	}
	END {
	 n = eq_ref + eq_alt + poza
	 print "genom = DArT REF:", eq_ref+0
	 print "genom = DArT ALT:", eq_alt+0
	 print "poza {REF,ALT}: ", poza+0
	 printf "spójnych (REF lub ALT): %.1f%%\n", 100*(eq_ref+eq_alt)/n
	}'
genom = DArT REF: 760
genom = DArT ALT: 780
poza {REF,ALT}:  3
spójnych (REF lub ALT): 99.8%

Ćwiczenie 4.3

 cut -f2- dart_genotypes.tsv | tail -n +2 | tr '\t' '\n' | sort | uniq -c
   2462 ./.
  96784 0/0
  12907 0/1
  76599 1/1

cut -f2- test_dart_genotypes.tsv | tail -n +2 | tr '\t' '\n' | sort | uniq -c
  22555 ./.
  96784 0/0
  12907 0/1
  76599 1/1

Błąd nie powoduje żadnego komunikatu, ponieważ awk traktuje przecinki w cudzysłowie jako zwykłe separatory pól, które są w 13 polach liczbowych w pliku. Dane przed właściwymi genotypami pasują tylko do else, więc mamy sporo dodatkowych genotypów ./.. 

Ćwiczenie 4.4

Wyniki dla step2_core_rc.tsv:
genom = DArT REF: 760
genom = DArT ALT: 780
poza {REF,ALT}:  3
spójnych (REF lub ALT): 99.8%

Wyniki dla step1_core.tsv:
genom = DArT REF: 478
genom = DArT ALT: 475
poza {REF,ALT}:  590
spójnych (REF lub ALT): 61.8%

Odsetek poza po korekcie spadł, ponieważ odwróciliśmy litery sond na nici minus, aby można je było porównać z genomem. Gdybyśmy nie skorygowali nici, nie dało by się porównać liter sond na nici minus z sekwencją referencyjną.

________________

W komendzie z punktu 7. Obliczenie pozycji genomowej usunęłam w komendzie +1 oraz -1, ponieważ wyniki sprawdzenia z punktu 15.3, spójnych (REF lub ALT) wychodziły mi około 50% przy testowaniu pliku step2_core_rc.tsv jak i step1_core.tsv. Pozycje SNP wewnątrz sondy były liczone od zera, nie od jedynki, stąd nieprawidłowy wynik dopasowania u mnie. 
W związku z tą zmianą w komendzie w ćwiczeniu 4.2 wynik poza zakresem wyniósł 14, ponieważ tyle SNP musiało leżeć na skrajnych pozycjach dopasowania sondy, co przy indeksowaniu od zera wypycha jedną współrzędną poza granicę dopasowania. 
