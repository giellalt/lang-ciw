#!/bin/sh

# Example:
#    cat otw-tag-key.tsv| ./add-crk-style-abstract-tagging.sh |
#    ./extract-tags-4-multichar-symbols.sh |
#    less

gawk 'BEGIN { FS="\t"; }
NR==1 {
  for(i=2; i<=NF; i++)
     if(index(toupper($i),"COMMENT")==0)
       comment[i]=$i;
}
NR>=2 {
  for(i=2; i<=NF; i++)
     if(i in comment)
     {
       anl=$i;
       sub(".*_","",anl);
       gsub("\\+(VII|VAI|VAIO|VTI|VTA)","",anl);
       n=split(anl,tags,"+");
       for(j=2; j<=n; j++)
          {
            ntags[comment[i]]["+"tags[j]]++;
          }
     }
}
END { PROCINFO["sorted_in"]="@ind_str_asc";
  for(c in comment)
     for(t in ntags[comment[c]])
        nshared[t]++;
  printf "! SHARED TAGS\n";
  for(t in nshared)
     if(nshared[t]==2)
       {
         gsub("0","%&",t);
         printf "%s\n", t;
       }
  printf "\n";
  for(c in comment)
     {
       printf "! %s\n", comment[c];
       for(t in ntags[comment[c]])
          {
            gsub("0","%&",t);
            if(nshared[t]!=2)
              printf "%s\n", t;
          }
       printf "\n";
     }
}'
