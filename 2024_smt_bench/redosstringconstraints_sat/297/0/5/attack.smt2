(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{5c}\u{5c}") (re.+  (str.to_re "\u{64}") ))
))
(assert (= infix 
        (re.inter (re.+  (str.to_re "\u{64}") )  (re.++ (re.+  (str.to_re "\u{64}") ) (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) )) (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) ) )
))
(assert (= postfix 
         (str.to_re "\u{25ce}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)