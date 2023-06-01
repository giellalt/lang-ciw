PYTHON=python3

# Definitions for building the LEXC files
EXCELDIR=../createYaml
EXCELTOLEXC=./excel2lexc.py
SUBCLASSES=VII VAI VTI
LEXCTARGETS=$(SUBCLASSES:%=%.lexc)

# Definitions for building the FST
FOMA=foma
FSTSCRIPT=ojibwe-templ.xfst
FSTTARGET=ojibwe.fomabin

# Definitions for YAML tests. These depends on the env variable GTCORE
# which is set when you build giella-core (I think...)
ifndef GTCORE
       $(error The GTCORE environment variable is not set)
endif
MORPHTEST=$(GTCORE)/scripts/morph-test.py 
YAMLTESTDIR=../createYaml/yaml_output
LOOKUP=flookup
MORPHFILTER=filter-fails.py

all:ojibwe.fomabin $(LEXCTARGETS)

%.lexc:$(EXCELDIR)/%-splitstem.xlsx
	$(PYTHON) $(EXCELTOLEXC) --excel_file $< --lexc_file $@

$(FSTTARGET):$(FSTSCRIPT) $(LEXCTARGETS)
	$(FOMA) -f $<

check:all
	(for f in `ls $(YAMLTESTDIR)/*yaml`; do \
                echo YAML test file: $$f && \
                $(PYTHON) $(MORPHTEST) --hide-passes --app $(LOOKUP) --surface --mor $(FSTTARGET) $$f | \
                $(PYTHON) $(MORPHFILTER) --yaml_filename $$f ; \
                done) | \
        tee yamltest.log

clean:
	rm -f $(FSTTARGET) $(LEXCTARGETS) yamltest.log 
