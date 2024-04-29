(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{5c}\u{7b}") (re.+  (str.to_re "\u{2c}") ))
))
(assert (= infix 
         (re.++ (re.+  (str.to_re "\u{2c}") ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (str.to_re "\u{2c}") ) (re.++ (re.*  (re.++  (str.to_re "\u{5c}\u{7b}") (re.++ (re.+  (str.to_re "\u{2c}") )  (str.to_re "\u{5c}\u{7d}"))) ) (re.*  (str.to_re "\u{2c}") ))) (re.++  (str.to_re "\u{26}") (re.++ (re.*  (str.to_re "\u{2c}") ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (str.to_re "\u{25ce}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)