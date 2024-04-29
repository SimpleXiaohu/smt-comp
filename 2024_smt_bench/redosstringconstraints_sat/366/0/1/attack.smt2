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
          (re.++  (str.to_re "\u{43}") (re.++  (str.to_re "\u{46}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{77}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{6b}") (re.++  (str.to_re "\u{2f}") (re.++  (str.to_re "\u{35}") (re.++  (str.to_re "\u{34}") (re.++  (str.to_re "\u{38}") (re.++ re.allchar (re.++  (str.to_re "\u{30}") (re.++ re.allchar  (str.to_re "\u{33}")))))))))))))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{40}")  (str.to_re "\u{40}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)