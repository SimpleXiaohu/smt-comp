(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{47}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{6c}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{78}") (re.++  (str.to_re "\u{79}") (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{49}")  (str.to_re "\u{49}")))))))))))))))
))
(assert (= infix 
         (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ) (re.++ (re.opt  (str.to_re "\u{5c}\u{2f}") ) (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ))) (re.++  (str.to_re "\u{26}") (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (str.to_re "\u{40}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)