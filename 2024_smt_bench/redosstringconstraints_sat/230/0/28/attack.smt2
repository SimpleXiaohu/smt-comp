(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{4a}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{76}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{31}") (re.++ re.allchar (re.++  (str.to_re "\u{31}") re.allchar)))))))
))
(assert (= infix 
         (re.++  (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.* (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) ) )) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{5f}")) ) (re.* (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) ) ))) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{7e}") (re.++  (str.to_re "\u{41}")  (str.to_re "\u{7e}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)