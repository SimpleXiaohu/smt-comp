
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

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{75}")  (str.to_re "\u{73}"))))
))
(assert (= infix 
        (re.inter (re.* re.allchar )  (re.++ (re.* re.allchar ) (re.++  (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{55}") (re.++  (str.to_re "\u{53}") (re.++ (re.*  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{3b}"))) ) (re.opt  (re.union  (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{66}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{20}") (re.++  (re.union  (re.++  (str.to_re "\u{50}") (re.++  (str.to_re "\u{61}")  (str.to_re "\u{64}")))  (re.++  (str.to_re "\u{50}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6d}")  (str.to_re "\u{65}"))))))  (str.to_re "\u{20}")))))))))))))) (re.union  (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{66}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{72}")  (str.to_re "\u{20}")))))))))))) (re.union  (re.++  (str.to_re "\u{50}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{66}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{65}")  (str.to_re "\u{20}"))))))))  (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{78}") (re.++  (str.to_re "\u{75}") (re.++  (str.to_re "\u{73}")  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5f}")))))))))) )))))) (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) ))) (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) ) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{7e}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{41}")  (str.to_re "\u{7e}"))))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)
(exit)