
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