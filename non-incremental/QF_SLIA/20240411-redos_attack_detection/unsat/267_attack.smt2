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
(set-info :status unsat)

(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{61}")  (str.to_re "\u{09}"))
))
(assert (= infix 
         (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}") (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{09}") (re.union  (str.to_re "\u{5c}\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))))))) ) (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) )) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}") (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{09}") (re.union  (str.to_re "\u{5c}\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))))))) ) (re.++ (re.*  (str.to_re "\u{3d}") ) (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ))) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))
))
(assert (= postfix 
         (re.inter  (re.++  (str.to_re "\u{20}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )) (re.comp  (re.inter (re.* re.allchar )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)
(exit)
