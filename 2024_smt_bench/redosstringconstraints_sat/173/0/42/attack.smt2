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
        (re.inter  (re.++ (re.*  (re.++ (re.* re.allchar )  (str.to_re "\u{2c}")) ) (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) ))  (re.++ (re.*  (re.++ (re.* re.allchar )  (str.to_re "\u{2c}")) ) (re.++  (re.++ (re.*  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) ) (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) )) (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) ))) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}")  (str.to_re "\u{40}"))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)