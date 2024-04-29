(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{46}") (re.++  (str.to_re "\u{6c}") (re.++  (str.to_re "\u{79}") (re.++  (str.to_re "\u{5f}") (re.++  (str.to_re "\u{46}")  (str.to_re "\u{33}")))))))
))
(assert (= infix 
        (re.inter  (re.++ (re.+ (re.range "0" "9") ) (re.*  (str.to_re "\u{3b}") ))  (re.++ (re.+ (re.range "0" "9") ) (re.*  (str.to_re "\u{3b}") )) )
))
(assert (= postfix 
         (str.to_re "\u{40}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)