(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
    (re.+  (re.union (re.range "0" "9")  (str.to_re "\u{2e}")) )
))
(assert (= infix 
         (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}")  (str.to_re "\u{5c}\u{2e}")) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}")  (str.to_re "\u{5c}\u{2e}")) ) (re.++  (re.+  (re.union  (str.to_re "\u{25}")  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.union (re.range "\u{30}" "\u{39}")  (str.to_re "\u{5f}"))))) ))) (re.++  (str.to_re "\u{26}") (re.++ (re.+  (re.union  (str.to_re "\u{25}")  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.union (re.range "\u{30}" "\u{39}")  (str.to_re "\u{5f}"))))) ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{7e}") (re.++  (str.to_re "\u{41}")  (str.to_re "\u{7e}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)