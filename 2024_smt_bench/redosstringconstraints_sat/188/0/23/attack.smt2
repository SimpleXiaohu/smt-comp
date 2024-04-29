(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{09}")  (str.to_re "\u{41}")))
))
(assert (= infix 
        (re.inter (re.+  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{6e}")  (str.to_re "\u{5c}\u{74}"))) )  (re.++ (re.+  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{6e}")  (str.to_re "\u{5c}\u{74}"))) ) (re.+  (str.to_re "\u{5c}\u{6e}") )) (re.+  (str.to_re "\u{5c}\u{6e}") ) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{41}")  (str.to_re "\u{0a}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)