(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
    (str.to_re "")
))
(assert (= infix 
          (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{79}") (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{62}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{2f}")  (str.to_re "\u{33}")))))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}")  (str.to_re "\u{40}"))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)