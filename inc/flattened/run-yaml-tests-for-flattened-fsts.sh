# Instructions for running YAML tests with the original glossing and flattened versions of the Odawa (otw) FST

# Original glossing FST

# Run in lang-otw

./autogen.sh
./configure --enable-glossers

# Running the standard YAML testing function in GiellaLT (which also compiles the regular FSTs that are needed)

make check

# Testing one order of one individual verb lexeme (included in one YAML file)

/usr/local/bin/python3 ../giella-core/scripts/morph-test.py -i -v -S hfst --app "/usr/local/bin/hfst-optimized-lookup" --morph src/analyser-gt-glossing.hfstol --gen src/generator-gt-glossing.hfstol  test/src/gt-gloss-yamls/VTA_AM_CNJ_waabam_gt-glossing.yaml | less

# Aggregating all verb YAML files into one file (uing the original glossing tags)
# and saving the results into a single file

cat test/src/gt-gloss-yamls/V*_gt-glossing.yaml| gawk 'NR<=12; NR==13 { printf "  VERBS - ALL :\n\n"; } NR>13 && $0 ~ /^[ \t]+[^#:]+\+/ { match($0,"([^ :]+):[ ]+([^#]+)([ ]*)",f); if(f[1]!="") printf "%5s%s: %s\n", "", f[1], f[2]; }' > inc/flattened/VERBS_gloss_ALL.yaml

# Examining the aggregated results before saving, and extracting the overall stats (using optimized HFST models)

python3 ../giella-core/scripts/morph-test.py -i -o compact -S hfst --app "/usr/local/bin/hfst-optimized-lookup" --morph src/analyser-gt-glossing.hfstol --gen src/generator-gt-glossing.hfstol inc/flattened/VERBS_gloss_ALL.yaml | less

# [FAIL] Test 0: VERBS - ALL (Lexical/Generation) 1086/513/1599
# [FAIL] Test 1: VERBS - ALL (Surface/Analysis) 1086/79/11x65
# Total passes: 2172, Total fails: 592, Total: 2764

# Saving the results to a file

python3 ../giella-core/scripts/morph-test.py -i -v -S hfst --app "/usr/local/bin/hfst-optimized-lookup" --morph src/analyser-gt-glossing.hfstol --gen src/generator-gt-glossing.hfstol inc/flattened/VERBS_gloss_ALL.yaml > inc/flattened/VERB_min_gloss_ALL_yaml_hfst_results.txt

# Comparing the HFST results with FOMA ones:

python3 ../giella-core/scripts/morph-test.py -i -o compact -S foma --app "/usr/local/bin/flookup" --morph src/analyser-gt-glossing.foma --gen src/generator-gt-glossing.foma inc/flattened/VERBS_gloss_ALL.yaml

# [FAIL] Test 0: VERBS - ALL (Lexical/Generation) 228/981/1209
# [FAIL] Test 1: VERBS - ALL (Surface/Analysis) 228/916/1144
# Total passes: 456, Total fails: 1897, Total: 2353

# The difference is much greater than I'd be comfortable with (recall that the standard compilation produced lots of errors).
# However, compiling the FOMA FSTs from scratch provide results exactly similar to the HFST ones.

foma[0]: read lexc src/fst/lexicon.tmp.lexc 
877.0 kB. 35240 states, 55214 arcs, 1304151822757442 paths.

foma[1]: define M
defined M: 877.0 kB. 35240 states, 55214 arcs, 1304151822757442 paths.

foma[0]: source src/fst/phonology.xfscript
67.2 MB. 83669 states, 4403794 arcs, Cyclic.

foma[1]: define P
defined P: 67.2 MB. 83669 states, 4403794 arcs, Cyclic.

foma[0]: set flag-is-epsilon ON
variable flag-is-epsilon = ON

foma[0]: define rmBound [[ "<" | ">" | "<<" | ">>" ] -> 0 ];
redefined rmBound: 460 bytes. 1 state, 5 arcs, Cyclic.

foma[0]: regex M .o. P .o. rmBound ;
1.2 MB. 45424 states, 80134 arcs, 3301546216225850 paths.

foma[1]: save stack analyzer-gt-glossing.foma
foma[1]: invert net
fome[1]: save stack generator-gt-glossing.foma

python3 ../giella-core/scripts/morph-test.py -i -o compact -S foma --app "/usr/local/bin/flookup" --morph analyzer-gt-glossing.foma --gen generator-gt-glossing.foma inc/flattened/VERBS_gloss_ALL.yaml 

# [FAIL] Test 0: VERBS - ALL (Lexical/Generation) 1086/513/1599
# [FAIL] Test 1: VERBS - ALL (Surface/Analysis) 1086/79/1165
# Total passes: 2172, Total fails: 592, Total: 2764

# Flattened abstract FST

# Run in lang-otw/inc/flattened

# Create the flattened FSTs (note that the names of the resultant files have been standardized and changed)

./otw-compile-new-fst-w-flattened-suffixes.sh

# Converting the original glossing tags in the aggregated YAML file into either set of our abstract tags,
# and storing the results in a new YAML file

./convert-gloss-to-abs-yaml-tagging.sh VERBS_gloss_ALL.yaml '' odawa > VERBS_abs_otw_ALL.yaml 

./convert-gloss-to-abs-yaml-tagging.sh VERBS_gloss_ALL.yaml '' ojibwe > VERBS_abs_oji_ALL.yaml 

# Composing the final FSTs, if the shell-script above didn't already accomplish that

foma -l otw-compose-models-w-flattened-suffixes.xfscript

# A current list of FOMA FSTs:

# -rw-r--r--  1 arppe  staff  82580  9 Feb 00:39 otw-analyzer-flattened-abstract-postsyncope.fomabin
# -rw-r--r--  1 arppe  staff  62229  9 Feb 00:39 otw-analyzer-flattened-glossing-postsyncope.fomabin
# -rw-r--r--  1 arppe  staff  83229  9 Feb 00:39 otw-generator-flattened-abstract-postsyncope.fomabin
# -rw-r--r--  1 arppe  staff  62544  9 Feb 00:39 otw-generator-flattened-glossing-postsyncope.fomabin
# -rw-r--r--  1 arppe  staff  89693  9 Feb 00:39 otw-verb-flattened-abstract-postsyncope.fomabin
# -rw-r--r--  1 arppe  staff  76763  9 Feb 00:39 otw-verb-flattened-abstract-presyncope.fomabin
# -rw-r--r--  1 arppe  staff  59797  9 Feb 00:39 otw-verb-flattened-glossing-presyncope.fomabin

# Running the abstracted YAML file against the flattened syncope model with abstract tags and with the FOMA FSTs

python3 ../../../giella-core/scripts/morph-test.py -i -o compact -S foma --app "/usr/local/bin/flookup" --morph otw-analyzer-flattened-abstract-postsyncope.fomabin --gen otw-generator-flattened-abstract-postsyncope.fomabin VERBS_abs_otw_ALL.yaml       

# [FAIL] Test 0: Lemma - ALL (Lexical/Generation) 1023/562/1585
# [FAIL] Test 1: Lemma - ALL (Surface/Analysis) 1023/134/1157
# Total passes: 2046, Total fails: 696, Total: 2742

# Saving to results to a file

python3 ../../../giella-core/scripts/morph-test.py -i -v -S foma --app "/usr/local/bin/flookup" --morph otw-analyzer-flattened-abstract-postsyncope.fomabin --gen otw-generator-flattened-abstract-postsyncope.fomabin VERBS_abs_otw_ALL.yaml > VERB_abs_ALL_yaml_foma_results.txt

# Comparing the results against flattened FSTs but using glossing tags (with FOMA):

python3 ../../../giella-core/scripts/morph-test.py -i -o compact -S foma --app "/usr/local/bin/flookup" --morph otw-analyzer-flattened-glossing-postsyncope.fomabin --gen otw-generator-flattened-glossing-postsyncope.fomabin VERBS_gloss_ALL.yaml

# [FAIL] Test 0: VERBS - ALL (Lexical/Generation) 1031/541/1572
# [FAIL] Test 1: VERBS - ALL (Surface/Analysis) 1031/133/1164
# Total passes: 2062, Total fails: 674, Total: 2736

# Compiling the HFST versions of the flattened FSTs

hfst-xfst -l otw-compose-models-w-flattened-suffixes.hfscript

# Testing the aggregate YAML tests with the HFST versions

python3 ../../../giella-core/scripts/morph-test.py -i -o compact -S foma --app "/usr/local/bin/hfst-lookup" --morph otw-analyzer-flattened-abstract-postsyncope.hfst --gen otw-generator-flattened-abstract-postsyncope.hfst VERBS_abs_otw_ALL.yaml

# [FAIL] Test 0: Lemma - ALL (Lexical/Generation) 1023/562/1585
# [FAIL] Test 1: Lemma - ALL (Surface/Analysis) 1023/134/1157
# Total passes: 2046, Total fails: 696, Total: 2742

##### END #####
