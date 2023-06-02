# `excel2fst`

## Install dependencies
First, install dpendencies by `pip3 install -r requirements.txt`. This also depends on a working installation of `giella-core`. You'll get an error if you `GTCORE` enviroment variable hasn't been set.

## Build LEXC files and the Ojibwe FST

Then, run the command `make all` in the terminal to build `ojibwe.fomabin` and lexc-files.

## Run yaml tests

Run `make check`. This will print the output of the yaml tests. It will also write them into a log-file `yamltest.log` (the log-file is overwritten every time you run `make check`). 

## Run interactively

You can use `flookup` (use `cat` instead of `echo` to feed in a file of word forms):

```
% echo "zanagad" | flookup ojibwe.fomabin 
zanagad	zanagad+VII+Ind+Pos+Neu+0SgProx
```

You can also use the `foma` console:

```
% foma
Foma, version 0.10.0
Copyright © 2008-2021 Mans Hulden
This is free software; see the source code for copying conditions.
There is ABSOLUTELY NO WARRANTY; for details, type "help license"

Type "help" to list all commands available.
Type "help <topic>" or help "<operator>" for further help.

foma[0]: load ojibwe.fomabin
28.6 kB. 922 states, 1691 arcs, 12075 paths.
foma[1]: up zanagad
zanagad+VII+Ind+Pos+Neu+0SgProx
foma[1]: ^D
```
## Query an FST analyzer (i.e. `ojibwe.fomabin`) in python

We can query the FST model for a particular stem using the functions in `query.py` (this code depends on the `foma.py` module which is included in the repo).

First, load the FST:

```
from query import load_fst

model = load_fst("ojibwe.fomabin")
```

Then, we can retrieve all inflected forms and their analyses for a given stem like `zanagad`:

```
for analysis in query(stem="zanagad", analyzer_fst=model):
    print(analysis)
    
OUTPUT:

('zanagad+VII+Cnj+Pos+Dub+0SgProx/0PlProx', 'zanagadogwen')
('zanagad+VII+Cnj+Pos+Dub+0SgObv/0PlObv', 'zanagadinigwen')
('zanagad+VII+Cnj+Pos+Neu+0SgObv/0PlObv', 'zanagadinig')
('zanagad+VII+Cnj+Pos+Prt+0SgObv/0PlObv', 'zanagadinigiban')
('zanagad+VII+Ind+Pos+Dub+0PlObv', 'zanagadiniwidogenan')
('zanagad+VII+Ind+Pos+Dub+0SgObv', 'zanagadiniwidog')
('zanagad+VII+Ind+Pos+Neu+0PlObv', 'zanagadiniwan')
('zanagad+VII+Ind+Pos+Neu+0SgObv', 'zanagadini')
('zanagad+VII+Ind+Pos+Prt+0PlObv', 'zanagadiniibaniin')
('zanagad+VII+Ind+Pos+Prt+0PlObv', 'zanagadiniibanen')
('zanagad+VII+Ind+Pos+Prt+0SgObv', 'zanagadiniiban')
('zanagad+VII+Ind+Pos+Neu+0SgProx', 'zanagad')
('zanagad+VII+Ind+Pos+Neu+0PlProx', 'zanagadoon')
('zanagad+VII+Ind+Pos+Prt+0PlProx', 'zanagadoobaniin')
('zanagad+VII+Ind+Pos+Prt+0PlProx', 'zanagadoobanen')
('zanagad+VII+Ind+Pos+Prt+0SgProx', 'zanagadooban')
('zanagad+VII+Ind+Pos+Dub+0PlProx', 'zanagadodogenan')
('zanagad+VII+Ind+Pos+Dub+0SgProx', 'zanagadodog')
('zanagad+VII+Cnj+Neg+Dub+0SgObv/0PlObv', 'zanagasininiigwen')
('zanagad+VII+Cnj+Neg+Dub+0SgProx/0PlProx', 'zanagasinoogwen')
('zanagad+VII+Cnj+Neg+Neu+0SgObv/0PlObv', 'zanagasininig')
('zanagad+VII+Cnj+Neg+Neu+0SgProx/0PlProx', 'zanagasinog')
('zanagad+VII+Cnj+Neg+Prt+0SgObv/0PlObv', 'zanagasininigiban')
('zanagad+VII+Cnj+Neg+Prt+0SgProx/0PlProx', 'zanagasinoogiban')
('zanagad+VII+Cnj+Pos+Neu+0SgProx/0PlProx', 'zanagak')
('zanagad+VII+Cnj+Pos+Prt+0SgProx/0PlProx', 'zanagakiban')
('zanagad+VII+Ind+Neg+Dub+0PlObv', 'zanagasininiwidogenan')
('zanagad+VII+Ind+Neg+Dub+0PlProx', 'zanagasinodogen')
('zanagad+VII+Ind+Neg+Dub+0SgObv', 'zanagasininiwidog')
('zanagad+VII+Ind+Neg+Dub+0SgProx', 'zanagasinodog')
('zanagad+VII+Ind+Neg+Neu+0PlObv', 'zanagasininiwan')
('zanagad+VII+Ind+Neg+Neu+0PlProx', 'zanagasinoon')
('zanagad+VII+Ind+Neg+Neu+0SgObv', 'zanagasinini')
('zanagad+VII+Ind+Neg+Neu+0SgProx', 'zanagasinoon')
('zanagad+VII+Ind+Neg+Prt+0PlObv', 'zanagasininiibaniin')
('zanagad+VII+Ind+Neg+Prt+0PlObv', 'zanagasininiibanen')
('zanagad+VII+Ind+Neg+Prt+0PlProx', 'zanagasinoobaniin')
('zanagad+VII+Ind+Neg+Prt+0PlProx', 'zanagasinoobanen')
('zanagad+VII+Ind+Neg+Prt+0SgObv', 'zanagasininiiban')
('zanagad+VII+Ind+Neg+Prt+0SgProx', 'zanagasinooban')
```

We can also constrain the analyses. Here we get all inflected forms for zanagad where the verb subclass is `VII`, order is `Ind` and the subject is either `0SgObv` or `0SgProx`:

```
for analysis in query(stem="zanagad",
                      analyzer_fst=model,
                      poses=["VII"],
                      orders=["Ind"],
                      subjects=["0SgObv", "0SgProx"]):
        print(analysis)

OUTPUT:

('zanagad+VII+Ind+Pos+Dub+0SgObv', 'zanagadiniwidog')
('zanagad+VII+Ind+Pos+Neu+0SgObv', 'zanagadini')
('zanagad+VII+Ind+Pos+Prt+0SgObv', 'zanagadiniiban')
('zanagad+VII+Ind+Pos+Neu+0SgProx', 'zanagad')
('zanagad+VII+Ind+Pos+Prt+0SgProx', 'zanagadooban')
('zanagad+VII+Ind+Pos+Dub+0SgProx', 'zanagadodog')
('zanagad+VII+Ind+Neg+Dub+0SgObv', 'zanagasininiwidog')
('zanagad+VII+Ind+Neg+Dub+0SgProx', 'zanagasinodog')
('zanagad+VII+Ind+Neg+Neu+0SgObv', 'zanagasinini')
('zanagad+VII+Ind+Neg+Neu+0SgProx', 'zanagasinoon')
('zanagad+VII+Ind+Neg+Prt+0SgObv', 'zanagasininiiban')
('zanagad+VII+Ind+Neg+Prt+0SgProx', 'zanagasinooban')
```

If you want to analyze a specific form, it'll be **much faster** to call `apply_up()`:

```
for analysis in model.apply_up("zanagasinooban"):
    print(analysis)

OUTPUT:

zanagad+VII+Ind+Neg+Prt+0SgProx
```

Similarly, `apply_down()` works for generation:

```
for wordform in model.apply_down("zanagad+VII+Ind+Neg+Prt+0SgProx"):
    print(wordform)

OUTPUT:

zanagasinooban
```
