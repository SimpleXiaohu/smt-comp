(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{49}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{2d}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{31}") (re.++  (str.to_re "\u{31}")  (str.to_re "\u{31}"))))))))
))
(assert (= infix 
        (re.inter (re.+  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) )  (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ) (re.* re.allchar )) (re.* re.allchar ) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{3b}")  (str.to_re "\u{0a}"))))))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)