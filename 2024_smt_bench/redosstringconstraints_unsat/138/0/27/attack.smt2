(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{5c}\u{2f}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{5c}\u{7b}") (re.++  (str.to_re "\u{63}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{5f}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{78}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{70}") (re.++  (str.to_re "\u{6c}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{5c}\u{7c}") (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) )))))))))))))))))) (re.+ re.allchar ))
))
(assert (= infix 
        (re.inter (re.+ re.allchar )  (re.++ (re.+ re.allchar ) (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) )) (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) ) )
))
(assert (= postfix 
        (str.to_re "")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)