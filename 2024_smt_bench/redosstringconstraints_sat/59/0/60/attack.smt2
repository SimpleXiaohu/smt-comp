(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 32 32) infix) postfix)))
(assert (= prefix 
     (str.to_re "\u{22}")
))
(assert (= infix 
         (re.++  (re.++  (str.to_re "\u{7b}") (re.++  (re.++  (str.to_re "\u{7b}") (re.++  (str.to_re "\u{22}") (re.++  (str.to_re "\u{22}")  (str.to_re "\u{7d}")))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{22}") (re.++  (re.++  (str.to_re "\u{7b}") (re.++  (str.to_re "\u{22}")  (str.to_re "\u{22}")))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)