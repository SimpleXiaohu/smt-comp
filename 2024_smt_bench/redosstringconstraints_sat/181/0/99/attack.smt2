(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 32 32) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{3c}") (re.++  (str.to_re "\u{31}")  (str.to_re "\u{20}")))
))
(assert (= infix 
        (re.inter  (re.++  (str.to_re "\u{27}") (re.*  (str.to_re "\u{27}") ))  (str.to_re "\u{27}") )
))
(assert (= postfix 
         (str.to_re "\u{40}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)