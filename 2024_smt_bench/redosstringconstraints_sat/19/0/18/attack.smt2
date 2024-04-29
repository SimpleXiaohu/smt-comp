(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (re.union  (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}"))))))))))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}")))))))))))) (re.++  (str.to_re "\u{5c}\u{2e}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{5c}\u{5b}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") )  (str.to_re "\u{20}"))))))) (re.+ re.allchar ))
))
(assert (= infix 
         (re.++ (re.+  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (str.to_re "\u{5c}\u{5d}") (re.+  (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{5c}\u{22}") (re.++ (re.+  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) )  (str.to_re "\u{5c}\u{22}")))) ))) (re.++  (str.to_re "\u{26}") (re.++ (re.+  (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{5c}\u{22}") (re.++ (re.+  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) )  (str.to_re "\u{5c}\u{22}")))) ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{31}")  (str.to_re "\u{0a}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)