(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{3b}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (re.++  (str.to_re "\u{49}") (re.++  (str.to_re "\u{2d}") (re.++  (str.to_re "\u{42}") (re.++  (str.to_re "\u{75}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{64}")  (str.to_re "\u{79}")))))))  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5f}"))))) (re.+  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ))
))
(assert (= infix 
         (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ) (re.++  (re.*  (str.to_re "\u{20}") ))) (re.++  (str.to_re "\u{26}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (str.to_re "\u{40}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)