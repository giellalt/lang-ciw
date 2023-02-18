#/bin/sh

# Check role of order tags in conversion
# Check treatment of imperative tags

# Example:
#    cat otw-verbs-flattened-w-flags.pairs | ./otw-gloss-full-tags-2-abstract-order.sh 'odawa' | less

gawk -v STYLE=$1 'BEGIN { FS="\t"; style=STYLE;
  if(style=="odawa")
    convcol=3;
  if(style=="gloss")
    convcol=1;
  if(style=="ojibwe" || (style!="odawa" && style!="gloss"))
    convcol=2;
  while((getline < "otw-verbs-glossing-to-abstract.conversion")!=0)
    {
      left=$1; right=$convcol
      # sub("^_","",left);
      # sub("_\\+(VII|VAI|VAIO|VTI|VTA)(\\+(Cnj|Imp))?","",right);
      sub("_\\+(VII|VAI|VAIO|VTI|VTA)(\\+(Ind|Cnj|Imp))?","",right);
      conv[left]=right; # print "L:"left, "R:"right;
    }
  FS=" ";
}
NF!=0 {
  gloss=$1;
  form=$2;
  match(gloss,"\\^VERB[^\\^]*\\^",stem);
  sub("\\^VERB[^\\^]*\\^","_",gloss);
  abs=gloss;

  left=abs;
  sub("_.*$","",left);
  right=abs;
  sub("^.*_","",right);
  lflags="";

  while(match(left,"@[^@]+@",flag)!=0)
     {
       lflags=lflags flag[0];
       sub(flag[0],"",left);
     }
  rflags="";
  while(match(right,"@[^@]+@",flag)!=0)
     {
       rflags=rflags flag[0];
       sub(flag[0],"",right);
     }
  if(match(left,"([123X])\\+",person)!=0)
    {
      rflags="@R.Person."person[1]"@" rflags;
      sub("\\^VERB[^\\^]*\\^","&@R.Person."person[1]"@",form);
    }

  # gsub("\\+(Neg|Dub|Prt)","",right);

  newtags="";
  neg=sub("\\+Neg","",right);
  dub=sub("\\+Dub","",right);
  prt=sub("\\+Prt","",right);

  match(right,"\\+(VII|VAIO|VAI|VTI|VTA)(\\+(Cnj|Imp))?",posorder);
  pos="+" posorder[1];
  order="+" posorder[3];
  if(order=="+")
    order="+Ind";

  if(neg)
    newtags="+Neg";
  else
    newtags="+Pos";
  if(dub)
    newtags=newtags "+Dub";
  if(prt)
    newtags=newtags "+Prt";
  if(!dub && !prt)
    newtags=newtags "+Neu";
  
  # if(match(abs,"\\+(Cnj|Imp)")==0)
  #   newtags="Ind" newtags "+";

  convtag=conv[left "_" right];
  if(convtag=="")
    convtag="+MISSING";

  print lflags left stem[0] rflags pos order newtags convtag "\t" form;

  # sub("\\+(VII|VAI|VAIO|VTI|VTA)\\+(|Cnj|Imp)","&"newtags,abs);

  # printf "%s\t%s\n",  gloss, abs;
}'
