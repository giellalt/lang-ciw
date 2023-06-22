# Structure of the verb morphotax and phonology

fst/root.lexc:
- multichar-symbols and root lexicon (-> person prefixes)
-> fst/affixes/verb_prefixes.lexc:
   - person prefixes, followed by grammatical and lexical prefixation within LEXC
   - beginning mixes two ways of implementing person prefixes (one presumed embedding prefixes, the other fully within LEXC)
   - ends with boundary marker for stems '<<', taking to the 4 stem types
  -> fst/stems/VII_stems.lexc
  -> fst/stems/VTA_stems.lexc
  -> fst/stems/VTI_stems.lexc
  -> fst/stems/vai_stems.lexc
     -> fst/affixes/VII_suffixes.lexc
     -> fst/affixes/VAI_suffixes.lexc
     -> fst/affixes/VTI_suffixes.lexc
     -> fst/affixes/VTA_suffixes.lexc
=> morphotax

fst/phonology.xfscript
- original presumed embedding of prefixes
- may not yet fully remove multiples of adjacent prefix boundary markers
=> phonotax

morphotax .o. phonotax
