(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 512 512) infix) postfix)))
(assert (= prefix 
     (str.to_re "\u{22}")
))
(assert (= infix 
         (str.to_re "\u{0c}")
))
(assert (= postfix 
         (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{0a}")  (str.to_re "\u{21}"))))))))))))))))))))))))))))))))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)