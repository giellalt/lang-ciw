


















* Sets for POS sub-categories





* Sets for Semantic tags





* Sets for Morphosyntactic properties






































































































































































* Sets for verbs


- V is all readings with a V tag in them, REAL-V should
be the ones without an N tag following the V.  
The REAL-V set thus awaits a fix to the preprocess V ... N bug.



* The set COPULAS is for predicative constructions







* NP sets defined according to their morphosyntactic features







* The PRE-NP-HEAD family of sets

These sets model noun phrases (NPs). The idea is to first define whatever can
occur in front of the head of the NP, and thereafter negate that with the
expression **WORD - premodifiers**.












The set **NOT-NPMOD** is used to find barriers between NPs.
Typical usage: ... (*1 N BARRIER NPT-NPMOD) ...
meaning: Scan to the first noun, ignoring anything that can be
part of the noun phrase of that noun (i.e., "scan to the next NP head")






* Miscellaneous sets





















* Border sets and their complements













* Syntactic sets




These were the set types.



## HABITIVE MAPPING


* **hab1** 


* **hab2** 

* **hab3** (<hab> @ADVL>) for hab-actor and hab-case; if leat to the right, and Nom to the right of leat. Lots of restrictions.



* **habNomLeft** 


* **hab4** 	



* **hab6** 

* **hab7** 

* **hab8** This is not HAB
* **hab5**  This is not HAB



* **habDain** (<hab> @ADVL>) for (Pron Dem Pl Loc) if leat followed by Nom to the right




* **habGen** (<hab> @<ADVL) hab for Gen; if Gen is located in the end of the sentence and Nom is sentence initial










































































* **spred<obj** (@SPRED<OBJ) for Acc; the object of an SPRPED. Not to be mistaken with OPRED. If SPRED is to the left, and copulas is to the left of it. Nom or Hab are found sentence initially.


* **Hab<spred** (@<SPRED) for Nom; if copulas, goallut or jápmit is FMAINV and habitive or human Loc is found to the left. OR: if Ill or @Pron< followed by HAB are found to the left.

* **Hab>Advlcase<spred** (<ext> @<SUBJ) for Nom; it allows adverbials with Ill/Loc/Com/Ess to be found inbetween HAB and <ext>.

* **Nom>Advlcase<spred** (<ext> @<SUBJ) for Nom; it allows adverbials with Ill/Loc/Com/Ess to be found inbetween Nom and <ext> @<SUBJ.

* **<spred** (<ext> @<SUBJ) for Nom; if copulas to the left, and some kind of adverb, N Loc, time related word or Po to the left of it. OR: if Ill or @Pron< to the left, followed by copulas and the before mentioned to the left of copulas. 

* **<spred** (<ext> @<SUBJ) for Nom, but not for Pers. To the left boahtit or heaŋgát as MAINV, and futher to the left is some kind of place related word, or time related word


* **<spredQst1** (<ext> @<SUBJ) for Nom in a typically question sentence; if A) Hab, some kind of place word, Po or Nom to the left, and Qst followed by copulas to the left. B) same as a, only the Qst-pcle is attached to copulas. C) Qst to the left, with copulas to its left, but not if two Nom:s are found somewhere to the right. D) copulas to the left, and BOS to the left. E) Loc or Ill to the left, and Loc or Hab to the left of this, Qst and copulas to the left. F) Num @>N to the left, Hab, some kind of place word, Po or Nom to the left, and Qst followed by copulas to the left. NOTE) for all these rules; human, Loc or Sem/Plc not allowed to the right.

* **<spredQst2** (@<SPRED) for Nom; in a typically question sentence; differs from <spredQst1 by not beeing as restricted to the right. Though you are not allowed to be Pers or human.

* **Nom<spredQst** (@<SPRED) for Nom; in a typically question sentence. Differs from <spredQst2 by letting Nom be found between SPRED and copulas



* **<spred** (@<SPRED) for A Nom or N Nom if; the subject Nom is on the same side of copulas as you: on the right side of copulas

* **<spredVeara** (@<SPRED) for veara + Nom; if genitive immediately to the right, and intransitive mainverb to the right of genitive

* **leftCop<spred** (@<SPRED) for Nom; if copulas is the main verb to the left, and there is no Ess found to the left of cop (note that Loc is allowed between target and cop). OR: if you are Coll or Sem/Group with copulas to your left. 

* **<spredLocEXPERIMENT** (@<SPRED) for material Loc; if you are to the right of copulas, and the Nom to the left of copulas is not a hab-actor


* **NumTime** (@<SPRED) for A Nom

* **<spredSg** (@<SPRED) for Sg Nom	

* **<spredPg** (@<SPRED) for Pl Nom	

* **<spred** (@<SPRED) for Nom; if copulas to the left, and Nom or sentence boundary to the left of copulas. First one to the right is EOS.

* **<spred** (@<SPRED) for N Ess

* **spredEss>** (@SPRED>) for N Ess; if copulas to the right of you, and if an NP with nom-case first one to your left.

* **HABSpredSg>** (@SPRED>) for Nom; if habitive first one to the left, followed by copulas.

* **GalleSpred>** (@SPRED>) for Num Nom; if sentence initial

* **spredSgMII>** (@SPRED>)

* **r492>** (@SPRED>) for Interr Gen; consisting only of negations. You are not allowed to be MII. You are not allowed to have an adjective or noun to yor right. You are not allowed to have a verb to your right; the exception beeing an aux.



* **AdjSpredSg>** (@SPRED>) for A Sg Nom; if copulas to the right, but not if A or @<SPRED are found to the right of copulas

* **SpredSg>Hab** (@SPRED>) for Nom; if you are sentence initial, copulas is located to the right, and there is a habitive to the right of copulas



* **Spred>SubjInf** (@SPRED>) for Nom; if copulas to the right, and the subject of copulas is an Inf to the right

* **spredCoord** (@<SPRED) coordination for Nom; only if there already is a SPRED to the left of CNP. Not if there is some kind of comparison involved.






* **subj>Sgnr1** (@SUBJ>) for Nom Sg, including Indef Nom if; VFIN + Sg3 or Pl3 to the right (VFIN not allowed to the left) 

* **subj>Du** (@SUBJ>) for dual nominatives, including Coll Nom. VFIN + Du3 to the right. 
* **subj>Pl** (@SUBJ>) for plural nominatives, including Coll and Sem/Group. VFIN + Pl3 to the right.

* **subj>Pl** (@SUBJ>) for plural nominatives


* **subj>Sgnr2** (@SUBJ>) for Nom Sg; if VFIN + Sg3 to the right.

* **<subjSg** (@<SUBJ) for Nom Sg; if VFIN Sg3 or Du2 to the left (no HAB allowed to the left).




















* **f<advl** (@-F<ADVL) for infinite adverbials

* **f<advl** (@-F<ADVL) for infinite adverbials



* **s-boundary=advl>** (@ADVL>) for ADVL that resemble s-booundaries. Mainverb to the right.




* **-fobj>** (@-FOBJ>) for Acc 

* **-fobj>** (@-FOBJ>) for Acc




* **advl>mainV** (@ADVL>) if; finite mainverb not found to the left, but the finite mainverb is found to the right.


* **<advl** (@<ADVL) if; finite mainverb found to the left. Not if a comma is found immediately to the left and a finite mainverb is located somewhere to the right of this comma.




* **<advlPoPr** (@<ADVL) if mainverb to the left.
* **advlPoPr>** (@<ADVL) if mainverb to the right.



* **advlEss>** (@<ADVL) for weather and time Ess, if FMAINV to the left.






* **advl>inbetween** (@ADVL>) for Adv; if inbetween two sentenceboundaries where no mainverb is present.

* **comma<advlEOS** (@<ADVL) if; comma found to the left and the finite mainverb to the left of comma. To the right is the end of the sentence.



* **advlBOS>** (@ADVL>) if; you are N Ill and found sentnece initially. First one to your right is a clause.


* **<advlPoEOS** (@<ADVL) for Po; if you are found at the very end of a sentence. A mainverb is needed to the right though.



* **cleanupILL<advl** (@<ADVL) for N Ill if; there are no boundarysymbols to your left, if you arent already @N< OR @APP-N<, and no mainverb is to yor left.











* **<opredAAcc** (@<OPRED) for A Acc; if an other accusative to the left, and a transtive verb to the left of it. OR: if a transitive verb to the left, and an accusative to the left of it.


### sma object









* **<advlEss** (@<ADVL) for ESS-ADVL if; FMAINV to the left
* **<spredEss** (@<SPRED) for N Ess if; FMAINV to the left is intransitive or bargat





## SUBJ MAPPING - leftovers

## OBJ MAPPING - leftovers


## HNOUN MAPPING
















* * *
<small>This (part of) documentation was generated from [../src/cg3/functions.cg3](http://github.com/giellalt/lang-ciw/blob/main/../src/cg3/functions.cg3)</small>













# Rules


**RULENAME**  




* * *
<small>This (part of) documentation was generated from [../src/fst/phonology.twolc](http://github.com/giellalt/lang-ciw/blob/main/../src/fst/phonology.twolc)</small>
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
* * *
<small>This (part of) documentation was generated from [../src/fst/affixes/verbs.lexc](http://github.com/giellalt/lang-ciw/blob/main/../src/fst/affixes/verbs.lexc)</small>
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






* * *
<small>This (part of) documentation was generated from [../src/fst/affixes/nouns.lexc](http://github.com/giellalt/lang-ciw/blob/main/../src/fst/affixes/nouns.lexc)</small>
# Symbol affixes





* * *
<small>This (part of) documentation was generated from [../src/fst/affixes/symbols.lexc](http://github.com/giellalt/lang-ciw/blob/main/../src/fst/affixes/symbols.lexc)</small>
Ojibwe postpositions                           

Do these even exist?


* * *
<small>This (part of) documentation was generated from [../src/fst/stems/prepositions.lexc](http://github.com/giellalt/lang-ciw/blob/main/../src/fst/stems/prepositions.lexc)</small>
Ojibwe verb morphology                           

We list personal and demonstrative pronouns, and still have
not made it to the reflexives.












* * *
<small>This (part of) documentation was generated from [../src/fst/stems/pronouns.lexc](http://github.com/giellalt/lang-ciw/blob/main/../src/fst/stems/pronouns.lexc)</small>
Ojibwe numerals                           


None so far.

* * *
<small>This (part of) documentation was generated from [../src/fst/stems/numerals.lexc](http://github.com/giellalt/lang-ciw/blob/main/../src/fst/stems/numerals.lexc)</small>
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
* * *
<small>This (part of) documentation was generated from [../src/fst/stems/verbs.lexc](http://github.com/giellalt/lang-ciw/blob/main/../src/fst/stems/verbs.lexc)</small>
Ojibwe postpositions                           

This is a dummy file, but perhaps *den* is a real subjunction?


* * *
<small>This (part of) documentation was generated from [../src/fst/stems/subjunctions.lexc](http://github.com/giellalt/lang-ciw/blob/main/../src/fst/stems/subjunctions.lexc)</small>
Ojibwe interjections                           

This is a dummy files, awaiting real interjections.

* * *
<small>This (part of) documentation was generated from [../src/fst/stems/interjections.lexc](http://github.com/giellalt/lang-ciw/blob/main/../src/fst/stems/interjections.lexc)</small>
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









* * *
<small>This (part of) documentation was generated from [../src/fst/stems/nouns.lexc](http://github.com/giellalt/lang-ciw/blob/main/../src/fst/stems/nouns.lexc)</small>
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



* * *
<small>This (part of) documentation was generated from [../src/fst/root.lexc](http://github.com/giellalt/lang-ciw/blob/main/../src/fst/root.lexc)</small>


We describe here how abbreviations are in Chippewa are read out, e.g.
for text-to-speech systems.

For example:

 * s.:syntynyt # ;  
 * os.:omaa% sukua # ;  
 * v.:vuosi # ;  
 * v.:vuonna # ;  
 * esim.:esimerkki # ; 
 * esim.:esimerkiksi # ; 


* * *
<small>This (part of) documentation was generated from [../src/transcriptions/transcriptor-abbrevs2text.lexc](http://github.com/giellalt/lang-ciw/blob/main/../src/transcriptions/transcriptor-abbrevs2text.lexc)</small>















































% komma% :,      Root ;
% tjuohkkis% :%. Root ;
% kolon% :%:     Root ;
% sárggis% :%-   Root ; 
% násti% :%*     Root ; 

* * *
<small>This (part of) documentation was generated from [../src/transcriptions/transcriptor-numbers-digit2text.lexc](http://github.com/giellalt/lang-ciw/blob/main/../src/transcriptions/transcriptor-numbers-digit2text.lexc)</small>
[ L A N G U A G E ]  G R A M M A R   C H E C K E R









# DELIMITERS


# TAGS AND SETS



## Tags


This section lists all the tags inherited from the fst, and used as tags
in the syntactic analysis. The next section, **Sets**, contains sets defined
on the basis of the tags listed here, those set names are not visible in the output.




### Beginning and end of sentence
BOS
EOS



### Parts of speech tags

N
A
Adv
V
Pron
CS
CC
CC-CS
Po
Pr
Pcle
Num
Interj
ABBR
ACR
CLB
LEFT
RIGHT
WEB
QMARK
PPUNCT
PUNCT

COMMA
¶



### Tags for POS sub-categories

Pers
Dem
Interr
Indef
Recipr
Refl
Rel
Coll
NomAg
Prop
Allegro
Arab
Romertall


### Tags for morphosyntactic properties

Nom
Acc
Gen
Ill
Loc
Com
Ess
Ess
Sg
Du
Pl
Cmp/SplitR
Cmp/SgNom Cmp/SgGen
Cmp/SgGen
PxSg1
PxSg2
PxSg3
PxDu1
PxDu2
PxDu3
PxPl1
PxPl2
PxPl3
Px

Comp
Superl
Attr
Ord
Qst
IV
TV
Prt
Prs
Ind
Pot
Cond
Imprt
ImprtII
Sg1
Sg2
Sg3
Du1
Du2
Du3
Pl1
Pl2
Pl3
Inf
ConNeg
Neg
PrfPrc
VGen
PrsPrc
Ger
Sup
Actio
VAbess



Err/Orth



### Semantic tags

Sem/Act
Sem/Ani
Sem/Atr
Sem/Body
Sem/Clth
Sem/Domain
Sem/Feat-phys
Sem/Fem
Sem/Group
Sem/Lang
Sem/Mal
Sem/Measr
Sem/Money
Sem/Obj
Sem/Obj-el
Sem/Org
Sem/Perc-emo
Sem/Plc
Sem/Sign
Sem/State-sick
Sem/Sur
Sem/Time
Sem/Txt

HUMAN

HAB-ACTOR
HAB-ACTOR-NOT-HUMAN


PROP-ATTR
PROP-SUR



TIME-N-SET


###  Syntactic tags

@+FAUXV
@+FMAINV
@-FAUXV
@-FMAINV
@-FSUBJ>
@-F<OBJ
@-FOBJ>
@-FSPRED<OBJ
@-F<ADVL
@-FADVL>
@-F<SPRED
@-F<OPRED
@-FSPRED>
@-FOPRED>
@>ADVL
@ADVL<
@<ADVL
@ADVL>
@ADVL
@HAB>
@<HAB
@>N
@Interj
@N<
@>A
@P<
@>P
@HNOUN
@INTERJ
@>Num
@Pron<
@>Pron
@Num<
@OBJ
@<OBJ
@OBJ>
@OPRED
@<OPRED
@OPRED>
@PCLE
@COMP-CS<
@SPRED
@<SPRED
@SPRED>
@SUBJ
@<SUBJ
@SUBJ>
SUBJ
SPRED
OPRED
@PPRED
@APP
@APP-N<
@APP-Pron<
@APP>Pron
@APP-Num<
@APP-ADVL<
@VOC
@CVP
@CNP
OBJ
<OBJ
OBJ>
<OBJ-OTHERS
OBJ>-OTHERS
SYN-V
@X





## Sets containing sets of lists and tags

This part of the file lists a large number of sets based partly upon the tags defined above, and
partly upon lexemes drawn from the lexicon.
See the sourcefile itself to inspect the sets, what follows here is an overview of the set types.



### Sets for Single-word sets

INITIAL


### Sets for word or not

WORD
REAL-WORD
REAL-WORD-NOT-ABBR
NOT-COMMA


### Case sets

ADLVCASE

CASE-AGREEMENT
CASE

NOT-NOM
NOT-GEN
NOT-ACC

### Verb sets


NOT-V

### Sets for finiteness and mood

REAL-NEG

MOOD-V

NOT-PRFPRC


### Sets for person

SG1-V
SG2-V
SG3-V
DU1-V
DU2-V
DU3-V
PL1-V
PL2-V
PL3-V





### Pronoun sets

















### Adjectival sets and their complements




### Adverbial sets and their complements




### Sets of elements with common syntactic behaviour


### NP sets defined according to their morphosyntactic features








### The PRE-NP-HEAD family of sets

These sets model noun phrases (NPs). The idea is to first define whatever can
occur in front of the head of the NP, and thereafter negate that with the
expression **WORD - premodifiers**.





















### Border sets and their complements











### Grammarchecker sets








* * *
<small>This (part of) documentation was generated from [../tools/grammarcheckers/grammarchecker.cg3](http://github.com/giellalt/lang-ciw/blob/main/../tools/grammarcheckers/grammarchecker.cg3)</small>