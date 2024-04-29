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
        (re.inter  (re.++ (re.* re.allchar ) (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) ))  (re.++ (re.* re.allchar ) (re.++  (re.++  (str.to_re "\u{2c}") (re.++ (re.*  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) ) (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) ))) (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) ))) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{22}") (re.++  (str.to_re "\u{41}")  (str.to_re "\u{22}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)