import argparse
import glob
import time
import os

def to_consistent_file(filename:str, status: str): 
    global file_counter
    lines = []
    with open(filename, "r") as f:
      lines = f.readlines()
    outputfile = os.path.join(outputdir, f"{file_counter}_{os.path.basename(filename)}")
    file_counter += 1
    with open(outputfile, "w") as f:
      header =  f"""
(set-info :smt-lib-version 2.6)
(set-logic QF_SLIA)
(set-info :source |
Generated by: Denghang Hu, Rongcheng Li, Zhilin Wu, Philipp Rummer, and Oliver,
Generated on: {time},
Generator: ReDoSHunter4SymExec,
Application: ReDoS attack detection,
Description: The dataset is generated by the tool ReDoSHunter4SymExec
 at https://github.com/SuperMaxine/ReDoSHunter4SymExec, to test whether attacks for a regular expression exist.  
Target solver: Ostrich, Z3str3, CVC5
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status {status})

"""
      f.write(header)
      for line in lines:
        if not ("set-info" in line or "set-logic" in line or "exit" in line):
            f.write(line)
      f.write("\n(exit)")
        
def to_consistent_dir(dirname:str, status: str):
    for filename in glob.glob(dirname + "/**/*.smt2", recursive=True):
        to_consistent_file(filename, status)

# parse arguments
parser = argparse.ArgumentParser(
    prog=__file__, description="Let the submitied smt2 files to be consistent with the instructions at https://github.com/SMT-LIB/benchmark-submission"
)
parser.add_argument("inputdir")
parser.add_argument("--status", default="unknown", help="status of the benchmark")

file_counter = 0
time = time.strftime("%Y%m%d", time.localtime())

if __name__ == "__main__":
    args = parser.parse_args()
    outputdir = os.path.join("non-incremental", "QF_SLIA", f"{time}-redos_attack_detection", args.status)
    os.makedirs(outputdir, exist_ok=True)
    to_consistent_dir(args.inputdir, args.status)

