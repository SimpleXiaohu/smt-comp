(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{42}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{45}") (re.++  (str.to_re "\u{63}") (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{2f}") (re.++  (str.to_re "\u{31}") re.allchar)))))))))
))
(assert (= infix 
        (re.inter (re.+ (re.range "0" "9") )  (re.++ (re.+ (re.range "0" "9") ) (re.++  (re.++ (re.opt  (str.to_re "\u{5c}\u{2e}") ) (re.opt  (re.union  (str.to_re "\u{61}")  (str.to_re "\u{62}")) )) (re.+ (re.range "0" "9") ))) (re.+ (re.range "0" "9") ) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{31}")  (str.to_re "\u{21}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)