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
          (re.++  (str.to_re "\u{43}") (re.++  (str.to_re "\u{46}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{77}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{6b}")  (str.to_re "\u{2f}"))))))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{40}")  (str.to_re "\u{25ce}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)