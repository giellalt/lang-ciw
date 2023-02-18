#!/bin/sh

# Usage:
# ./convert-gloss-to-abs-yaml-tagging.sh 1:PATH-TO-GLOSSING-YAML 2:LEMMA 3:STYLE

# Example:
#    ./convert-gloss-to-abs-yaml-tagging.sh ../../test/src/gt-gloss-yamls/VTA_AM_CNJ_waabam_gt-glossing.yaml waabmaa odawa | less

cat $1 |

gawk -v LEMMA=$2 -v STYLE=$3 'BEGIN { lemma=LEMMA; style=STYLE;
  if(style!="ojibwe" && style!="odawa")
    style="ojibwe";
  if(lemma=="")
    lemma="ALL";
}

!body { print;
  if(index($0,"Tests:")!=0)
    {
      body=1;
      printf "\n";
      printf "  Lemma - %s :\n\n", lemma;
    }
}

body && match($0,"^[ \t]*#")==0 {
  if(match($0, "^[ \t]+([^:]+):[ \t]*([^#]+)[ ]*$", f)!=0)
    {
      anl=f[1]; form=f[2];
      if(match(anl,"([^\\+]+)\\+(VII|VAI|VAIO|VTI|VTA|NA|NI|NAD|NID)", ff)!=0)
        {
          lemma=ff[1];
          printf "^LEMMA^\t%s\n", lemma | "./otw-gloss-full-tags-2-abstract-order.sh "style; 
        }
      sub(lemma,"^VERB^",anl);
      gsub(" ", "#", form);
      printf "%s\t%s\n", anl, form | "./otw-gloss-full-tags-2-abstract-order.sh "style;
      # "./otw-gloss-full-tags-2-abstract-order.sh "style |& getline conv;
      # close("./otw-gloss-full-tags-2-abstract-order.sh "style);
      # print conv;
      fflush();
    }
}' |

gawk -v LEMMA=$2 'BEGIN { lemma=LEMMA; }
{
  if(match($0, "\\^LEMMA\\^")!=0)
    {
      if(LEMMA=="")
        lemma=$2;
    }
  else
  if(index($0,"^VERB^")!=0)
  {
    sub("\\^VERB\\^",lemma,$0);
    gsub("@[^@]+@","",$0);
    sub("^[123X]\\+","",$0);
    gsub("#"," ",$2);
    printf "     %s: %s\n", $1, $2;
  }
  else
    print;
}'
