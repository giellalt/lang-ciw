import click
from sys import stdin

""" This script filters out "unexpected results"-errors from yaml test
output when the order of the analysis (Cnj or Ind) doesn't match the
order of the yaml-testfile. These are probably not genuine errors (and,
even when they are, then they'll resurface for a different yaml
testfile with compatible order).  """

@click.command()
@click.option("--yaml_filename", required=True)
def main(yaml_filename):
    order=None
    if "_IND_" in yaml_filename:
        order = "+Ind+"
    elif "_CNJ_" in yaml_filename:
        order = "+Cnj+"
    else:
        raise NotImplementedError("Only _IND_ and _CNJ_ orders are supported by the filter script")

    for line in stdin:
        # Skip lines which don't relate to this order.
        if "Unexpected results:" in line:
            if not order in line:
                continue
        else:
            print(line, end='')

if __name__=="__main__":
    main()
