(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{2d}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{50}") (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{65}")  (str.to_re "\u{2f}"))))))))
))
(assert (= infix 
         (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (re.++ (re.opt  (str.to_re "\u{5c}\u{2e}") ) (re.++ (re.opt (re.+ (re.range "\u{30}" "\u{39}") ) ) (re.++ (re.opt  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++ (re.opt (re.+ (re.range "\u{30}" "\u{39}") ) ) (re.opt  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ))))) (re.+ (re.range "\u{30}" "\u{39}") ))) (re.++  (str.to_re "\u{26}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
        (str.to_re "")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)