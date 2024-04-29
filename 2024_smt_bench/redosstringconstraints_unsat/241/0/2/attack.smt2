(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++ (re.opt  (re.++  (re.union  (str.to_re "\u{3b}")  (str.to_re "\u{2c}")) (re.*  (str.to_re "\u{20}") )) ) (re.++ (re.opt  (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{63}") (re.++  (str.to_re "\u{63}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{5f}") (re.++  (str.to_re "\u{63}") (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{73}")  (str.to_re "\u{2d}")))))))))) ) (re.++  (str.to_re "\u{48}") (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{43}") (re.opt  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{5f}"))) )))))) (re.+  (str.to_re "\u{3b}") ))
))
(assert (= infix 
        (re.inter (re.+  (str.to_re "\u{3b}") )  (re.++ (re.+  (str.to_re "\u{3b}") ) (re.*  (str.to_re "\u{20}") )) (re.*  (str.to_re "\u{20}") ) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{3b}")  (str.to_re "\u{25ce}")))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)