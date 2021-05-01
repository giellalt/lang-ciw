
Ojibwe noun morphology                           


# Prefixes


The prefixes

 * LEXICON Noun 


 * LEXICON AN   animate nouns



 * LEXICON IN  inanimate nouns










Thereafter, lexc directs us to the ../stems/nouns.lexc file
where we find all the stems.

The stems/nouns.lexc file will then direct us back here, to 
the suffixes.



# Suffixes

Here, we give person suffixes. The flag diacritics
match the prefixes in the stem file.







# Symbol affixes






Ojibwe verb morphology                           


The verbs are analysed as follows:
* We split the Verb lexicon in 4 groups according to transitivity class
* For each group, we add the prefixes, and mark them with *flag diacritics* (the @ symbols)
* Then come the stems themselves
* Finally, come the suffixes, including flag diacritics
  to ensure that the correct prefixes and suffixes are matched together

Prefixes and suffixes are in affixes/verbs.lexc, whereas
the stems are in stems/verbs.lexc


The Ojibwe verbs are divided in four groups:

1. IA: Intransitive animate
1. II: Intransitive inanimate
1. TA: Transitive animate
1. TI: Transitive inanimate


# The prefixes


 LEXICON Verb  divides the verbs in four transitivity classes



Intransitive animate

 LEXICON IA    divides in independent, subjunctive and imperative



 LEXICON IA_INDEPENDENT    gives prefixes and flags for person-number in indicative



 LEXICON IA_SUBJUNCTIV    gives prefixes and flags for person-number in subjunctive



 LEXICON IA_IMPERATIV    gives prefixes and flags for person-number in imperative


Intransitive inanimate

These have no prefixes, so we go directly to the **IISTEM** lexicon.



Transitive animate

 LEXICON TA   is still not written


Transitive inanimate

 LEXICON TI   is still not written







# The suffixes





Intransitive animate (IA)

 LEXICON IACONJ  splits in 3 conjugations

 LEXICON IA_IND  gives positive and negative



 LEXICON IA_IND_SUFF  (so far) gives present tense only


 LEXICON IA_IND_PRS  gives person suffixes



 LEXICON IA_SBJ  gives flag diacritics and directs to subjunctive person suffixes












 LEXICON IA_IMP   gives flag diacritics and directs to imperative person suffixes






Intransitive inanimate (II)


 LEXICON IICONJ   splits according to conjugation

 LEXICON II_IND_PRS    is positive present

 LEXICON II_NEG_IND_PRS   is negative present

 LEXICON II_SBJ    is positive subjunctive

 LEXICON II_NEG_SBJ    is negative subjunctive


Transitive animate (TA)

 * LEXICON TACONJ_am   not yet written














# Rules


**RULENAME**  





Ojibwe postpositions

 # Definitions for Multichar_Symbols


POS


 * +Symbol = independent symbols in the text stream, like £, €, ©

Verbal MSP
 * +Prs  
 * +Fut  
 * +Prt  
 * +Prf  

 * +Ind  
 * +Imp   Imperative
 * +Sbj   Subjunctive
 * +Imm   Immediate,

 * +Int   Interdiction,
 * +Dur   Durative

 * +1Sg     first singular
 * +2Sg     etc
 * +3Sg    
 * +3oSg    3o is obviative,
 * +3iSg    3i is indefinite

 * +1Pl     1Pl is exclusive plural (I, them, not you)
 * +2Pl    
 * +3Pl    
 * +3oPl   
 * +3iPl   
 * +12Pl    12Pl is inclusive plural (I, you, ...)

 * +1SgO    objective conjugation
 * +2SgO   
 * +3SgO   
 * +SgO    
 * +3oSgO   obviative with objective conjugation
 * +3iSgO  
 * +1PlO   
 * +P2lO   
 * +3PlO   
 * +PlO    
 * +3oPlO  
 * +3iPlO  

 * +Inf     infinitive (infinite?)
 * +Pos     postitive
 * +Neg     negative
 * +ConNeg  accompanying negative form

Nominal MSP
 * +Sg		  singular
 * +Pl		  plural

 * +Px1Sg	  person prefixes for nouns
 * +Px2Sg	 
 * +Px3Sg	 
 * +Px1Pl	  obviative
 * +Px12Pl	  inclusive
 * +Px2Pl	 
 * +Px3Pl	 

 * +IA       intransitive with animate subject,
 * +II       intransitive with inanimate subject,
 * +TA       transitive with animate object, and
 * +TI       transitive with inanimate object.

 * +AN		  animate noun
 * +IN		  inanimate noun

 * %> 		  suffix border


Flagdiacritics

These are documented in Chapter 8 of Beesley/Karttunen, p. 456 zB.






## Symbols that need to be escaped on the lower side (towards twolc):
 * **»7**:  Literal »
 * **«7**:  Literal «
```
  %[%>%]  - Literal >
  %[%<%]  - Literal <
```




  LEXICON Root 		  is where it all starts

 * Noun ;	             
 * Verb ;	             
 * Pronoun ;            
 * Punctuation ;        
 * Symbols     ;        




Ojibwe noun stems                           

Note that both prefixes and suffixes are found in the file
../affixes/nouns.lexc


The stems

###  Animate Nouns





###  Inanimate Nouns

 LEXICON INSTEMS  

 waakaa'igan INDECL "house" ;  
 adopowin INDECL "table" ;     


 LEXICON KINSHIPSTEMS   

 * baabaa KINDECL "father" ;   
 * maamaa KINDECL "mother" ;   










Ojibwe verb morphology                           

We list personal and demonstrative pronouns, and still have
not made it to the reflexives.













Ojibwe postpositions                           

Do these even exist?



Ojibwe interjections                           

This is a dummy files, awaiting real interjections.


Ojibwe postpositions                           

This is a dummy file, but perhaps *den* is a real subjunction?



Ojibwe verb stems                           


The verbs are analysed as follows:
* We split the Verb lexicon in 4 groups according to transitivity class
* For each group, we add the prefixes, and mark them with *flag diacritics* (the @ symbols)
* Then come the stems themselves
* Finally, come the suffixes, including flag diacritics
  to ensure that the correct prefixes and suffixes are matched together

Prefixes and suffixes are in affixes/verbs.lexc, whereas
the stems are in stems/verbs.lexc

The Ojibwe verbs are divided in four groups:

1. IA: Intransitive animate
1. II: Intransitive inanimate
1. TA: Transitive animate
1. TI: Transitive inanimate



The stems


 LEXICON IASTEM    


-mo 



-de




-aa / go/be ?




VAI2 extracted from pdfs in Gikendandaa Ojibwemowin.
All of these are -am stems. What is (CH)?



VAI3 extracted from pdfs in Gikendandaa Ojibwemowin
All of these are -shin stems. What is (CH)?


dw- ?



 LEXICON IISTEM    


TODO: these need morphology

 LEXICON TASTEM_am    

 LEXICON TASTEM_aw    




-zo passives

TODO: morphology for the -zo passives

 LEXICON ZO    

Ojibwe numerals                           


None so far.

















































% komma% :,      Root ;
% tjuohkkis% :%. Root ;
% kolon% :%:     Root ;
% sárggis% :%-   Root ; 
% násti% :%*     Root ; 




We describe here how abbreviations are in Chippewa are read out, e.g.
for text-to-speech systems.

For example:

 * s.:syntynyt # ;  
 * os.:omaa% sukua # ;  
 * v.:vuosi # ;  
 * v.:vuonna # ;  
 * esim.:esimerkki # ; 
 * esim.:esimerkiksi # ; 


