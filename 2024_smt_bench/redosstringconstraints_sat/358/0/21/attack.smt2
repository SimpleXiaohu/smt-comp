(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{78}") (re.++  (str.to_re "\u{38}") (re.++  (str.to_re "\u{36}") (re.++  (str.to_re "\u{5f}") (re.++  (str.to_re "\u{36}") (re.++  (str.to_re "\u{34}") (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{31}") (re.++ re.allchar (re.++  (str.to_re "\u{31}") (re.++ re.allchar  (str.to_re "\u{31}"))))))))))))
))
(assert (= infix 
        (re.inter (re.* re.allchar )  (re.++ (re.* re.allchar ) (re.++  (re.++  (str.to_re "\u{43}") (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6d}")  (str.to_re "\u{65}")))))) (re.* re.allchar ))) (re.* re.allchar ) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{21}")  (str.to_re "\u{0a}"))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)