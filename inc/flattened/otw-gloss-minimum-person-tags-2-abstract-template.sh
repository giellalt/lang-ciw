#!/bin/sh

# cat otw-verbs-flattened-w-flags.pairs | ./otw-gloss-minimum-person-tags-2-abstract-template.sh| ./add-crk-style-abstract-tagging.sh > otw-verbs-glossing-to-abstract.conversion
    
gawk '{ 
  gloss=$1;
  sub("\\^VERB[^\\^]*\\^","_",gloss);
  while(sub("@[^@]+@","",gloss)!=0)
    { }
  gsub("\\+(Dub|Prt|Neg)","",gloss);
  gsub("PV/(e|a|gaa|ji\\+bwaa|CCNJ)\\+","",gloss);

  form=$2;
  while(sub("@[^@]+@","",form)!=0)
     { }
  
  printf "%s\t%s\n", gloss, gloss;
  # printf "%s\t%s\t%s\n", gloss, gloss, form;
}' |

sort -u
