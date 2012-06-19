# This is a makefile that builds the CIW morphological parser
# *****************************************************************
# This is a dummy file. CIW refers to the name of the language, ciw to the 
# ISO code of the language, for use in file names.

# This is a preliminary file that builds a CIW parser based upon
# xfst and not twolc.

# Here we build the final generator , an inverted transducer of the analyzer.
# It is dependent upon ciw.save

TWOLC = twolc 
LEXC = lexc
XFST = xfst

ifeq (victorio.uit.no, $(shell hostname))
XFST = /opt/sami/xerox/c-fsm/ix86-linux2.6-gcc3.4/bin/fst -utf8
LEXC = /opt/sami/xerox/bin/lexc -utf8
TWOLC = /opt/sami/xerox/bin/twolc -utf8
endif



iciw.fst: ../bin/iciw.fst
../bin/iciw.fst: ../bin/ciw.fst ../int/tag-not-save.fst
	@echo
	@echo "*** Building the inverse iciw.fst ***"
	@echo
	@printf "read regex [[@\"../int/tag-not-save.fst\"] .o. \
	[@\"../bin/ciw.save\"]] ; \n\
	invert net \n\
	save stack ../bin/iciw.fst \n\
	quit \n" > ../../tmp/iciw-fst-script
	$(XFST) < ../../tmp/iciw-fst-script
	@rm -f ../../tmp/iciw-fst-script



# We want to delete the +TA +IA etc. tags for the generator (and other
# tags later on?. For that we need our tag-deleter.
tag-not-save.fst: ../int/tag-not-save.fst
../int/tag-not-save.fst: tag-not-save.regex
	@echo
	@echo "*** Building tag-not-save.fst ***" ;
	@echo
	@printf "read regex < tag-not-save.regex \n\
	save stack ../int/tag-not-save.fst \n\
	quit \n" > ../../tmp/ciw-tag-not-save-script
	$(XFST) < ../../tmp/ciw-tag-not-save-script
	@rm -f ../../tmp/ciw-tag-not-save-script



# This goal is to build the final analyser. It depends on all the files.

ciw.fst: ../bin/ciw.fst
../bin/ciw.fst: ../bin/ciw.save ../bin/caseconv.fst 
	@echo
	@echo "*** Building ciw.fst ***" ;
	@echo
	@printf "read regex [[@\"../bin/ciw.save\"] .o. \
	[@\"../bin/caseconv.fst\"]] ; \n\
	save stack ../bin/ciw.fst \n\
	quit \n" > ../../tmp/ciw-fst-script
	$(XFST) < ../../tmp/ciw-fst-script
	@rm -f ../../tmp/ciw-fst-script


# The second goal is to build the caseconv.fst file
# This goal depends on case.regex

caseconv.fst: ../bin/caseconv.fst
../bin/caseconv.fst: case.regex
	@echo
	@echo "*** Building caseconv.fst ***" ;
	@echo
	@printf "read regex < case.regex \n\
	save stack ../bin/caseconv.fst \n\
	quit \n" > ../../tmp/caseconv-script
	$(XFST) < ../../tmp/caseconv-script
	@rm -f ../../tmp/caseconv-script



ciw.save: ../bin/ciw.save
../bin/ciw.save: ../bin/twol-ciw.bin ../bin/ciw-lex.save
	@echo
	@echo "*** Building the parser ciw.save ***"
	@echo
	@printf "read regex [[@\"../bin/ciw-lex.save\"] .o. \
	[@\"../bin/twol-ciw.bin\"]] ; \n\
	save stack ../bin/ciw.save \n\
	quit \n" > ../../tmp/ciw-save-script
	$(XFST) < ../../tmp/ciw-save-script
	@rm -f ../../tmp/ciw-save-script

# The first goal is to build ciw-lex.save
# This goal depends on a bunch of lexicon files

ciw-lex.save: ../bin/ciw-lex.save
../bin/ciw-lex.save: ciw-lex.txt noun-ciw-morph.txt noun-ciw-lex.txt \
	adj-ciw-lex.txt verb-ciw-morph.txt verb-ciw-lex.txt \
	cc-ciw-lex.txt cs-ciw-lex.txt interj-ciw-lex.txt \
	adv-ciw-lex.txt verb-ciw-lex.txt pron-ciw-lex.txt punct-ciw-lex.txt \
	pp-ciw-lex.txt  num-ciw-lex.txt 
	@echo
	@echo "*** Building ciw-lex.save ***" ;
	@echo
	printf "compile-source ciw-lex.txt noun-ciw-morph.txt noun-ciw-lex.txt \
	adj-ciw-lex.txt verb-ciw-lex.txt verb-ciw-morph.txt pron-ciw-lex.txt \
	cc-ciw-lex.txt cs-ciw-lex.txt interj-ciw-lex.txt \
	adv-ciw-lex.txt pp-ciw-lex.txt punct-ciw-lex.txt  num-ciw-lex.txt \n\
	save-source ../bin/ciw-lex.save \n\
	quit \n" > ../../tmp/ciw-lex-save-script
	$(LEXC) < ../../tmp/ciw-lex-save-script
	rm -f ../../tmp/ciw-lex-save-script



twol-ciw.bin: ../bin/twol-ciw.bin
../bin/twol-ciw.bin: twol-ciw.txt
	@echo
	@echo "*** Building twol-ciw.bin ***" ;
	@echo
	@printf "read-grammar twol-ciw.txt \n\
	compile \n\
	save-binary ../bin/twol-ciw.bin \n\
	quit \n" > ../tmp/twol-ciw-script
	$(TWOLC)  < ../tmp/twol-ciw-script
	@rm -f ../tmp/twol-ciw-script

### 
### # The second goal is to build xfst-ciw.bin
### # This goal depends on xfst-ciw.txt
### 
### xfst-ciw.bin: ../bin/xfst-ciw.bin
### ../bin/xfst-ciw.bin: xfst-ciw.txt
### 	@echo
### 	@echo "*** Building xfst-ciw.bin ***" ;
### 	@echo
### 	@printf "source xfst-ciw.txt \n\
### 	save stack ../bin/xfst-ciw.bin \n\
### 	quit \n" > ../../tmp/xfst-ciw-script
### 	$(XFST) < ../../tmp/xfst-ciw-script
### 	@rm -f ../../tmp/xfst-ciw-script

clean:
	@rm -f ../bin/*.bin ../bin/*.fst ../bin/*.save


