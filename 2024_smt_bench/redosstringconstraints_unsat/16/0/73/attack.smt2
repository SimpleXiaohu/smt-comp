(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++ (re.opt (re.opt  (str.to_re "\u{5c}\u{2f}") ) ) (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )) (re.+  (str.to_re "\u{5c}\u{2f}") ))
))
(assert (= infix 
        (re.inter  (re.++ (re.+  (str.to_re "\u{5c}\u{2f}") ) (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{2e}")) ))  (re.++ (re.+  (str.to_re "\u{5c}\u{2f}") ) (re.++  (str.to_re "\u{5c}\u{2e}") (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{2e}")) ))) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{2f}")  (str.to_re "\u{41}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)