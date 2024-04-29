(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (re.union  (re.++  (str.to_re "\u{5a}") (re.++  (str.to_re "\u{75}") (re.++  (str.to_re "\u{6e}")  (str.to_re "\u{65}"))))  (re.++  (str.to_re "\u{42}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{79}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{50}") (re.++  (str.to_re "\u{6f}")  (str.to_re "\u{64}"))))))))))  (str.to_re "\u{20}")) (re.+ (re.range "0" "9") ))
))
(assert (= infix 
        (re.inter (re.+ (re.range "0" "9") )  (re.++ (re.+ (re.range "0" "9") ) (re.++ (re.opt  (str.to_re "\u{5c}\u{2e}") ) (re.+ (re.range "0" "9") ))) (re.+ (re.range "0" "9") ) )
))
(assert (= postfix 
        (str.to_re "")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)