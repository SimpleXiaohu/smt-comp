(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{5c}\u{5b}") (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{70}") (re.++ (re.opt  (str.to_re "\u{73}") ) (re.++  (str.to_re "\u{3a}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.+  (re.union  (str.to_re "\u{5c}\u{5d}") (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))) )))))))))) (re.+ (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) ))
))
(assert (= infix 
         (re.++ (re.+  (re.union  (str.to_re "\u{0c}") (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}") (re.union  (str.to_re "\u{0d}") (re.union  (str.to_re "\u{09}")  (str.to_re "\u{0b}")))))) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{0c}") (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}") (re.union  (str.to_re "\u{0d}") (re.union  (str.to_re "\u{09}")  (str.to_re "\u{0b}")))))) ) (re.++  (re.*  (str.to_re "\u{5c}\u{5d}") ))) (re.++  (str.to_re "\u{26}") (re.++ (re.*  (str.to_re "\u{5c}\u{5d}") ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (str.to_re "\u{25ce}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)