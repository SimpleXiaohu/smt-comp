(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{70}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{74}")  (str.to_re "\u{20}"))))))))
))
(assert (= infix 
        (re.inter (re.+ re.allchar )  (re.++ (re.+ re.allchar ) (re.*  (str.to_re "\u{20}") )) (re.*  (str.to_re "\u{20}") ) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{0a}")  (str.to_re "\u{25ce}")))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)