#!/bin/sh

# Usage/examples:
#   cat otw-tag-key.tsv | ./add-crk-style-abstract-tagging.sh | less
#   cat otw-tag-key.tsv | ./add-crk-style-abstract-tagging.sh > otw-verbs-glossing-to-abstract.conversion


gawk 'BEGIN { FS="\t";
  printf "GLOSSING\tOTW/CH\tOTW/CRK\tCOMMENTS\n";
}
{
  gloss=$1; otw_ch=$2; comm=$3;

  # Standardization
  sub("\\+(Ind|IND)","",otw_ch);
  gsub("[0-5](sg|pl)O?","<&>",otw_ch); # Marking spurious capitalization

  # Conversions
  otw_crk=otw_ch;
  gsub("Excl","1Pl",otw_crk);
  gsub("Incl","21Pl",otw_crk);
  gsub("3SgProx","3Sg",otw_crk);
  gsub("3PlProx","3Pl",otw_crk);
  gsub("3SgObv","4Sg",otw_crk);
  gsub("3PlObv","4Pl",otw_crk);
  gsub("3Obv","4Sg/Pl",otw_crk);
  gsub("0SgProx","0Sg",otw_crk);
  gsub("0PlProx","0Pl",otw_crk);
  gsub("0SgObv","4Sg",otw_crk);
  gsub("0PlObv","4Pl",otw_crk);
  gsub("0Sg/PlProx","0Sg/Pl",otw_crk);
  gsub("0Sg/PlObv","4Sg/Pl",otw_crk);

  printf "%s\t%s\t%s\t%s\n", gloss, otw_ch, otw_crk, comm;
}' |

tr -s '\r' '\n' # Remove Windows-generated CR line endings, collapsing them with LF's
