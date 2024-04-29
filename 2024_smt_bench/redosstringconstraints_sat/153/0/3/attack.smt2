(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 1024 1024) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (re.union  (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{70}") (re.opt  (str.to_re "\u{73}") )))))  (re.++  (str.to_re "\u{66}") (re.++  (str.to_re "\u{74}")  (str.to_re "\u{70}")))) (re.++  (str.to_re "\u{3a}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.opt  (re.++  (str.to_re "\u{2d}")  (str.to_re "\u{5c}\u{2e}")) ))))) (re.+  (re.union  (str.to_re "\u{5c}\u{2e}") (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{23}") (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))  (str.to_re "\u{3f}"))))) ))
))
(assert (= infix 
        (re.inter (re.+  (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2e}") (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{23}") (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))  (str.to_re "\u{3f}"))))) ) (re.opt  (str.to_re "\u{5c}\u{2e}") )) ) (re.+  (re.union  (str.to_re "\u{5c}\u{2e}") (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{23}") (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))  (str.to_re "\u{3f}"))))) ) )
))
(assert (= postfix 
        (re.inter  (re.inter  (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{5c}\u{2e}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))) (re.comp (re.+  (re.union  (str.to_re "\u{5c}\u{2e}") (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{23}") (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))  (str.to_re "\u{3f}"))))) )))  (re.inter  (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{5c}\u{2e}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))) (re.comp  (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2e}") (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{23}") (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))  (str.to_re "\u{3f}"))))) )  (re.++ (re.opt  (str.to_re "\u{5c}\u{2e}") ) (re.++ (re.opt  (re.++  (str.to_re "\u{5c}\u{2f}") (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) )) )  (re.union  (str.to_re "\u{5c}\u{2e}") (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))  (str.to_re "\u{2c}")))))))) )
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)