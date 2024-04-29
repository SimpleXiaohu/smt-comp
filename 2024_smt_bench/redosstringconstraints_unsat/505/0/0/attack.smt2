(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{3b}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{58}") (re.++  (str.to_re "\u{4f}") (re.++  (str.to_re "\u{4c}") (re.++  (str.to_re "\u{4f}")  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5f}"))))))))  (re.inter (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))))
))
(assert (= infix 
        (re.inter (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) )  (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ) (re.++  (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{61}")  (str.to_re "\u{62}"))) (re.* re.allchar ))) (re.* re.allchar ) )
))
(assert (= postfix 
        (str.to_re "")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)