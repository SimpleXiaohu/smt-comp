(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 512 512) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{7b}") (re.++  (str.to_re "\u{67}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{5f}") (re.++  (str.to_re "\u{63}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{5f}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{78}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{70}") (re.++  (str.to_re "\u{6c}")  (str.to_re "\u{65}"))))))))))))))))))))))
))
(assert (= infix 
         (str.to_re "\u{5c}\u{28}") (re.inter (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) ) (re.+ re.allchar ) )   (re.++ (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) )  (str.to_re "\u{5c}\u{29}"))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{20}")  (str.to_re "\u{21}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)