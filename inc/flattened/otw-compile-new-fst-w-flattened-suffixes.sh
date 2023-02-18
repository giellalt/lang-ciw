#!/bin/sh

# Usage:
#    otw-compile-new-fst-w-flattened-suffixes.sh 1: TAGS:{odawa,ojibwe}

# Generate minimal LEXC code for flattening

## Without special symbols for rule-irrelavent morpheme boundaries
# cat copyright.lexc multichar_symbols.lexc root.lexc verb_prefixes.lexc verb_stems_placeholders.lexc verb_suffixes_minimalist.lexc > verb_lexicon_minimalist.lexc

echo 'CREATING SOURCE LEXC FILE';
## With special symbols '<<' and '>>' for morpheme boundaries not needed for phonological rules
cat copyright.lexc multichar_symbols.lexc root.lexc verb_prefixes.lexc verb_stems_placeholders.lexc verb_suffixes_minimalist_extra_bound.lexc > verb_lexicon_minimalist.lexc

echo 'CREATING ANALYSIS/WORDFORM PAIRS';
foma -f otw-generate-anl-surf-pairs-w-flattened-suffixes.xfscript

## Before abstracting the glossing tags, one should create the conversion table:
# cat otw-verbs-flattened-w-flags.pairs | ./otw-gloss-minimum-person-tags-2-abstract-template.sh > otw-tag-key.tsv
## Once completed, one can add Odawa-style tags:
# cat otw-tag-key.tsv | ./add-crk-style-abstract-tagging.sh > otw-verbs-glossing-to-abstract.conversion

echo 'CREATING ANALYSIS/WORDFORM PAIRS WITH ABSTRACT TAGS'; 
cat otw-verbs-flattened-w-flags.pairs |
    # egrep 'VAI[\+@]' | # Remember to remove and uncomment in stems
    ./otw-gloss-full-tags-2-abstract-order.sh $1 > otw-verbs-flattened-w-flags-abstract.pairs

echo 'TURNING SUFFIXES IN PAIRS INTO FLATTENED LEXC WITH ABSTRACT TAGS';
cat otw-verbs-flattened-w-flags-abstract.pairs |
    ./flatten-otw-suffixes.sh '+' > verb_suffixes_flattened_abstract.lexc

echo 'TURNING SUFFIXES IN PAIRS INTO FLATTENED LEXC WITH GLOSSING TAGS';
cat otw-verbs-flattened-w-flags.pairs |
    ./flatten-otw-suffixes.sh '+' > verb_suffixes_flattened_glossing.lexc

echo 'CONCATENATING ALL LEXC FILES TOGETHER';
cat copyright.lexc multichar_symbols.lexc root.lexc verb_prefixes.lexc verb_stems_examples.lexc verb_suffixes_flattened_abstract.lexc > verb_lexicon_flattened_abstract.lexc

cat copyright.lexc multichar_symbols.lexc root.lexc verb_prefixes.lexc verb_stems_examples.lexc verb_suffixes_flattened_glossing.lexc > verb_lexicon_flattened_glossing.lexc

echo 'COMPILING FLATTENED FSTs';
foma -f otw-compose-models-w-flattened-suffixes.xfscript

##### END #####
