
(set-info :smt-lib-version 2.6)
(set-logic QF_SLIA)
(set-info :source |
Generated by: Denghang Hu, Rongcheng Li, Zhilin Wu, Philipp Rummer, and Oliver Markgraf,
Generated on: 20240411,
Generator: ReDoSHunter4SymExec,
Application: ReDoS attack detection,
Description: The dataset is generated by the tool ReDoSHunter4SymExec
 at https://github.com/SuperMaxine/ReDoSHunter4SymExec, to test whether attacks for a regular expression exist.  
Target solver: Ostrich, Z3str3, CVC5
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

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{3b}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++ (re.opt  (re.union  (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{55}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{47}")  (str.to_re "\u{20}"))))))))  (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{75}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{67}")  (str.to_re "\u{20}"))))))))) )  (re.union  (re.++  (str.to_re "\u{47}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{6c}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{78}") (re.++  (str.to_re "\u{79}") (re.++  (str.to_re "\u{20}")  (re.union  (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{49}")  (str.to_re "\u{49}")))))))  (re.++  (str.to_re "\u{53}") (re.range "0" "9")))))))))) (re.union  (re.++  (str.to_re "\u{47}") (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{2d}") (re.++  (str.to_re "\u{49}") (re.++  (str.to_re "\u{39}") (re.++  (str.to_re "\u{30}") (re.++  (str.to_re "\u{38}")  (str.to_re "\u{32}")))))))) (re.union  (re.++  (str.to_re "\u{47}") (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{2d}") (re.++  (str.to_re "\u{49}") (re.++  (str.to_re "\u{39}") (re.++  (str.to_re "\u{32}") (re.++  (str.to_re "\u{30}")  (str.to_re "\u{35}")))))))) (re.union  (re.++  (str.to_re "\u{47}") (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{2d}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{37}")  (re.++  (re.++ (re.range "0" "9") (re.++ (re.range "0" "9") (re.range "0" "9"))) (re.*  (re.++ (re.range "0" "9") (re.++ (re.range "0" "9") (re.range "0" "9"))) )))))))  (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{2d}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{39}") (re.++  (str.to_re "\u{30}") (re.++  (str.to_re "\u{30}")  (str.to_re "\u{35}")))))))))))))))  (re.inter (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))))
))
(assert (= infix 
         (re.++  (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ) (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) )) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ) (re.++ (re.opt  (str.to_re "\u{5c}\u{2f}") ) (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ))) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))
))
(assert (= postfix 
         (str.to_re "\u{40}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)
(exit)