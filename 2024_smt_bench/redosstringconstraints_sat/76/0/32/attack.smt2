(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{67}") (re.++  (str.to_re "\u{62}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{5c}\u{28}") (re.*  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{6e}") (re.union  (str.to_re "\u{5c}\u{72}")  (str.to_re "\u{5c}\u{74}")))) )))))) (re.+ re.allchar ))
))
(assert (= infix 
        (re.inter (re.+ re.allchar )  (re.++ (re.+ re.allchar ) (re.*  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{6e}") (re.union  (str.to_re "\u{5c}\u{72}")  (str.to_re "\u{5c}\u{74}")))) )) (re.*  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{6e}") (re.union  (str.to_re "\u{5c}\u{72}")  (str.to_re "\u{5c}\u{74}")))) ) )
))
(assert (= postfix 
        (re.inter  (re.inter  (re.++  (str.to_re "\u{09}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )) (re.comp  (re.inter (re.*  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{6e}") (re.union  (str.to_re "\u{5c}\u{72}")  (str.to_re "\u{5c}\u{74}")))) )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))))  (re.inter  (re.++  (str.to_re "\u{09}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )) (re.comp  (re.++  (re.inter (re.*  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{6e}") (re.union  (str.to_re "\u{5c}\u{72}")  (str.to_re "\u{5c}\u{74}")))) )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))  (str.to_re "\u{5c}\u{29}")))) )
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)