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
          (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{2d}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{62}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6c}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{79}") (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{75}") (re.++  (str.to_re "\u{63}") (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{5f}") (re.++  (str.to_re "\u{33}") (re.++  (str.to_re "\u{47}")  (str.to_re "\u{5f}"))))))))))))))))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{2f}")  (str.to_re "\u{41}"))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)