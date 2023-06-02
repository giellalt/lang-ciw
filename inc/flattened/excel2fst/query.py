from foma import FST

# Feature names
POS="pos"
ORDER="order"
SUBJECT="subject"
MODE="mode"
POLARITY="polarity"

# Legal values for features
VALMAP = {
    POS:"VII VAI VTI VTA".split(' '),
    ORDER:"Cnj Ind".split(' '),
    SUBJECT:"0PlObv 0PlProx 0SgObv 0SgObv/0PlObv 0SgProx 0SgProx/0PlProx 1Sg 2Pl 2Sg 3PlObv 3PlProx 3SgObv 3SgProx X Incl Excl".split(' '),
    MODE:"Dub Dub+Prt Neu Prt".split(' '),
    POLARITY:"Pos Neg".split(' ')}

# Flag diacritics
# FIXME: A bit risky if the set of flags ever changes. We need a way
# to dig those out of the FST model rather than this fixed list.
FLAGS="@P.Prefix.NONE@ @P.Prefix.gi@ @P.Prefix.ni@ @R.Prefix.NONE@ @R.Prefix.gi@ @R.Prefix.ni@ @P.Prefix.NONE@ @R.Prefix.NONE@ @P.Prefix.NONE@ @P.Prefix.gi@ @P.Prefix.gid@ @P.Prefix.ind@ @P.Prefix.ni@ @P.Prefix.o@ @P.Prefix.od@ @R.Prefix.NONE@ @R.Prefix.gi@ @R.Prefix.gid@ @R.Prefix.ind@ @R.Prefix.ni@ @R.Prefix.o@ @R.Prefix.od@".split(" ")

# We'll use this expression to freely insert flag diacritics into the
# query
FLAGEXPR = " | ".join([f'"{flag}"' for flag in FLAGS])

def check_feat(feat_name, tags):
    if tags == None:
        return True
    for tag in tags:
        if not tag in VALMAP[feat_name]:
            raise ValueError(f"Illegal value {tag} for feature {feat_name}")
    return True

def load_fst(fn):
    return FST.load(fn)

def query(*,
          stem,
          analyzer_fst,
          preverbs=None,
          tense=None,
          poses=None,
          orders=None,
          subjects=None,
          modes=None,
          polarities=None):
    # Build query
    selector = f"{{{stem}}}"
    for feat_name, tags in [#("preverb",preverbs), # skip for now
                            #("tense",tenses), # skip for now
                            (POS, poses),
                            (ORDER, orders),
                            (POLARITY, polarities),
                            (MODE, modes),
                            (SUBJECT, subjects)]:
        if check_feat(feat_name,tags):
            if tags == None: 
                selector += "[ ? ]"
            else:
                possibilities = [f'"+{tag}"' for tag in tags]
                selector += f"[ {' | '.join(possibilities)} ]"
    
    selector = f"[ {selector} ] / [ {FLAGEXPR} ]"
    selector = FST(selector)
    # Apply query to analyzer_fst and return generator over analyses
    result = selector.compose(analyzer_fst)
    return zip(result.upperwords(), result.lowerwords())

# Small test
import time

if __name__=="__main__":
    # Timed load 
    start_load = time.time()
    model = load_fst("ojibwe.fomabin")
    stop_load = time.time()
    print(f"Model loaded in {1000*(stop_load - start_load)} ms")
    print()
    # Check that query does what it's supposed to
    print("Find all zanagad inflections where POS=+VII, ORDER=+Ind, SUBJECT=0SgObv|0SgProx")
    for analysis in query(stem="zanagad",
                          analyzer_fst=model,
                          poses=["VII"],
                          orders=["Ind"],
                          subjects=["0SgObv", "0SgProx"]):
        print(analysis)
    print()
    # N timed queries
    start_N_queries = time.time()
    N = 1000
    for i in range(N):
        query(stem="zanagad",
              analyzer_fst=model,
              poses=["VII"],
              orders=["Ind"],
              subjects=["0SgObv", "0SgProx"])
    stop_N_queries = time.time()
    print(f"Executed {N} queries in {1000*(stop_N_queries - start_N_queries)} ms")
    print(f"On average, {1000*(stop_N_queries - start_N_queries)/N} ms per query")
