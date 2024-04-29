(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 1024 1024) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{3d}") (re.++  (str.to_re "\u{20}")  (str.to_re "\u{3d}")))
))
(assert (= infix 
         (re.union  (re.++ (re.opt  (str.to_re "\u{5c}\u{72}") )  (str.to_re "\u{5c}\u{6e}"))  (str.to_re "\u{5c}\u{72}")) (re.inter (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) ) (re.+ re.allchar ) )  
))
(assert (= postfix 
         (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{20}")  (str.to_re "\u{21}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)