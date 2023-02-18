#!/bin/sh

# flatten-otw-suffixes.sh

# Usage:
#    0: standard input (FST input/analysis vs./output/morphotax pairs from unflattened FST
#    1: '+'/'yes' (vs. '-'/'no') for optional simplification of redundant P/R flag sequences

# Internal function 'stdflags' has option for shifting all flags to the left edges, or not,
# but in actual use having this option on is categorically required to produce working LEXC code

# Example:
#    cat otw-verb-classes-w-flags.pairs | ./flatten-otw-suffixes.sh '+' | less


gawk -v FLAGSIMPLIFY=$1 'BEGIN { FS="\t"; 
 if(FLAGSIMPLIFY=="yes" || FLAGSIMPLIFY=="+")
   flagsimplify=1;
}
{
  anl=$1; surf=$2;
  match(anl,"^(.*)\\^(VERB[^\\^]*)\\^(.*)$",anl2);
  match(surf,"^(.*)(\\^VERB[^\\^]*\\^)(.*)$",surf2);
  input=anl2[3];
  output=surf2[3];
  class=anl2[2]; sub("VERB","",class); sub("\\^.*$","",class); class=class "_TAG";
  match(anl2[3],"(VII|VAI|VAIO|VTI|VTA)[@\\+]",POS);
  pos=POS[1];

  left=stdflags(input, 1, flagsimplify);
  right=stdflags(output, 1, flagsimplify);

  contlex=pos class;
  nlexc[contlex][left][right]++;
  gsub(">","%>",right); # gsub("%>%>","%>>",right);
  gsub("0","%0",left);
  lexc[contlex][left][right]=sprintf("%s:%s #;", left, right);
#   lexc[contlex]=lexc[contlex] sprintf("%s:%s #;\n", left, right);
}
END { PROCINFO["sorted_in"]="@ind_str_asc";
  for(contlex in lexc)
     {
       printf "LEXICON %s\n", contlex;
#       printf "%s", lexc[contlex];
        for(left in lexc[contlex])
            for(right in lexc[contlex][left])
               printf "%s\n", lexc[contlex][left][right]
               # printf "%s - %i\n", lexc[contlex][left][right], nlexc[contlex][left][right];
       printf "\n";
     }
}

function stdflags(str, moveleft, simplify)
{
  delete flags; delete flag; nflags=0;
  delete prflags;
  if(moveleft)
    while(match(str,"@(.)\\.([^@]+)@", flag)!=0)
       {
         if(flag[1]=="P")
           prflags[flag[2]]="+";
         if(flag[1]=="R")
           if(prflags[flag[2]]=="+")
             prflags[flag[2]]="-";
         flags[++nflags]=flag[0];
         sub("@[^@]+@","",str);
       }
  std=str;
  for(i=nflags; i>=1; i--)
     if(flags[i]!=flags[i+1])
       {
         match(flags[i],"@(.)\\.([^@]+)@", flag);
         if(simplify && prflags[flag[2]]!="-" || !simplify)
           std=flags[i] std;
       }
  return std;
}
'
