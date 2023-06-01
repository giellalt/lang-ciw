EXCELDIR=../createYaml
EXCELTOLEXC=./excel2lexc.py
FOMA=foma
SUBCLASSES=VII VAI VTI
LEXCTARGETS=$(SUBCLASSES:%=%.lexc)
FSTSCRIPT=ojibwe-templ.xfst

all:ojibwe.fomabin $(LEXCTARGETS)

%.lexc:$(EXCELDIR)/%-splitstem.xlsx
	python3 $(EXCELTOLEXC) --excel_file $< --lexc_file $@

ojibwe.fomabin:$(FSTSCRIPT) $(LEXCTARGETS)
	$(FOMA) -f $<
