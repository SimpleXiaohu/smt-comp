(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.inter (re.* re.allchar )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))
))
(assert (= infix 
        (re.inter  (re.++ (re.* re.allchar ) (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) ))  (re.++ (re.* re.allchar ) (re.++  (re.++  (str.to_re "\u{2c}") (re.++ (re.*  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) ) (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) ))) (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) ))) )
))
(assert (= postfix 
        (re.inter  (re.inter  (re.++  (str.to_re "\u{2c}") (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{20}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))) (re.comp (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) )))  (re.inter  (re.++  (str.to_re "\u{2c}") (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{20}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))) (re.comp  (re.++ (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) )  (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{6c}") (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{3d}") (re.++ (re.opt  (re.union  (str.to_re "\u{22}")  (str.to_re "\u{5c}\u{27}")) ) (re.++ (re.*  (re.union  (str.to_re "\u{22}")  (str.to_re "\u{5c}\u{27}")) ) (re.opt  (re.union  (str.to_re "\u{22}")  (str.to_re "\u{5c}\u{27}")) )))))))))))) )
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)