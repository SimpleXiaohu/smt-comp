(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{3a}") (re.++ (re.* re.allchar )  (str.to_re "\u{2c}")))))))  (re.inter (re.* re.allchar )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))))
))
(assert (= infix 
         (re.++ (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (str.to_re "\u{5c}\u{23}") (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ))) (re.++  (str.to_re "\u{26}") (re.++ (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (re.inter  (re.++  (str.to_re "\u{23}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )) (re.comp  (re.inter (re.* re.allchar )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)