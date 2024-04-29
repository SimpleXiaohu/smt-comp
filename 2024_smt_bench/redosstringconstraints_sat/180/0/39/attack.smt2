(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{41}")  (str.to_re "\u{40}"))
))
(assert (= infix 
         (re.++  (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to_re "\u{5c}\u{2e}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to_re "\u{5f}")))))) ) (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to_re "\u{5c}\u{2e}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to_re "\u{5f}")))))) )) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to_re "\u{5c}\u{2e}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to_re "\u{5f}")))))) ) (re.++  (str.to_re "\u{5c}\u{2e}") (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to_re "\u{5c}\u{2e}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to_re "\u{5f}")))))) ))) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))
))
(assert (= postfix 
         (str.to_re "\u{7e}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)