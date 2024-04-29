(set-info :smt-lib-version 2.6)
(set-logic QF_SLIA)
(set-info :source |
Generated by: Denghang Hu, Rongcheng Li, Zhilin Wu, Philipp Rummer, and Oliver Markgraf,
Generated on: 20240411,
Generator: ReDoSHunter4SymExec,
Application: ReDoS attack detection,
Target solver: Ostrich, Z3str3, CVC5
Description: The dataset is generated by the tool ReDoSHunter4SymExec
 at https://github.com/SuperMaxine/ReDoSHunter4SymExec, to test whether attacks for a regular expression exist.  
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status sat)

(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 32 32) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++ (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) ) (re.++ (re.+  (re.++  (str.to_re "\u{5c}\u{2b}") (re.+  (re.union  (str.to_re "\u{3d}")  (str.to_re "\u{5c}\u{2d}")) )) ) (re.++  (str.to_re "\u{5c}\u{2b}") (re.++  (re.union  (re.++ (re.opt  (str.to_re "\u{5c}\u{72}") )  (str.to_re "\u{5c}\u{6e}"))  (str.to_re "\u{5c}\u{72}")) (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) )))))  (re.++  (re.union  (str.to_re "\u{2b}")  (str.to_re "\u{7c}")) (re.+ re.allchar )))
))
(assert (= infix 
        (re.inter  (re.union  (str.to_re "\u{2b}")  (str.to_re "\u{7c}")) (re.+ re.allchar ) )
))
(assert (= postfix 
         (str.to_re "\u{21}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)
(exit)
