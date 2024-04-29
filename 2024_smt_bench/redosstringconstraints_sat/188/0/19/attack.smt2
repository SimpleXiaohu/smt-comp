(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.range "\u{61}" "\u{7a}"))) ) (re.++ (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) )  (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))) ) (re.*  (str.to_re "\u{3d}") )))) (re.+  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{6e}")  (str.to_re "\u{5c}\u{74}"))) ))
))
(assert (= infix 
         (re.++ (re.+  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{09}"))) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{09}"))) ) (re.++  (re.+  (str.to_re "\u{0a}") ))) (re.++  (str.to_re "\u{26}") (re.++ (re.+  (str.to_re "\u{0a}") ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{41}")  (str.to_re "\u{0a}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)