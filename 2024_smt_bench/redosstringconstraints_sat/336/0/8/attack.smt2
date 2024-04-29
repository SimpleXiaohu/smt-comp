(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 40000 40000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{66}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{62}") (re.++  (str.to_re "\u{61}")  (str.to_re "\u{72}")))))) (re.+ (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")))) ))
))
(assert (= infix 
         (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{0c}") (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}") (re.union  (str.to_re "\u{0d}") (re.union  (str.to_re "\u{09}")  (str.to_re "\u{0b}")))))) ) (re.+  (re.union  (str.to_re "\u{0c}") (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}") (re.union  (str.to_re "\u{0d}") (re.union  (str.to_re "\u{09}") (re.union  (str.to_re "\u{0b}")  (str.to_re "\u{5c}\u{2e}"))))))) )) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{0c}") (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}") (re.union  (str.to_re "\u{0d}") (re.union  (str.to_re "\u{09}")  (str.to_re "\u{0b}")))))) ) (re.++  (re.++  (str.to_re "\u{5c}\u{2f}") (re.++ (re.+  (re.union  (str.to_re "\u{0c}") (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}") (re.union  (str.to_re "\u{0d}") (re.union  (str.to_re "\u{09}") (re.union  (str.to_re "\u{0b}")  (str.to_re "\u{5c}\u{2e}"))))))) )  (str.to_re "\u{5c}\u{2e}"))) (re.+  (re.union  (str.to_re "\u{0c}") (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}") (re.union  (str.to_re "\u{0d}") (re.union  (str.to_re "\u{09}") (re.union  (str.to_re "\u{0b}")  (str.to_re "\u{5c}\u{2e}"))))))) ))) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))
))
(assert (= postfix 
        (re.inter  (re.inter  (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{5c}\u{2e}") (re.++  (str.to_re "\u{00}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))))) (re.comp (re.+  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))  (str.to_re "\u{2e}")) )))  (re.inter  (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{5c}\u{2e}") (re.++  (str.to_re "\u{00}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))))) (re.comp  (re.++ (re.+  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))  (str.to_re "\u{2e}")) )  (re.++ (re.opt  (str.to_re "\u{5c}\u{2e}") ) (re.opt (re.+  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))  (str.to_re "\u{2e}")) ) ))))) )
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)