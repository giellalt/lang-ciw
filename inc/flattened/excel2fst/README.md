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
