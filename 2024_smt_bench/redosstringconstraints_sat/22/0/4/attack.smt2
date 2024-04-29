(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++ (re.+  (str.to_re "\u{3a}") )  (str.to_re "\u{3a}")) (re.+  (re.union  (str.to_re "\u{40}")  (str.to_re "\u{3a}")) ))
))
(assert (= infix 
         (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{40}")  (str.to_re "\u{3a}")) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{40}")  (str.to_re "\u{3a}")) ) (re.++  (re.+  (str.to_re "\u{5c}\u{40}") ))) (re.++  (str.to_re "\u{26}") (re.++ (re.+  (str.to_re "\u{5c}\u{40}") ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{3a}") (re.++  (str.to_re "\u{40}") (re.++  (str.to_re "\u{2f}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{3a}") (re.++  (str.to_re "\u{40}") (re.++  (str.to_re "\u{2f}")  (str.to_re "\u{0a}"))))))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)