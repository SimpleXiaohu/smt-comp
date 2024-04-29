(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 16 16) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++ (re.*  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) )  (str.to_re "\u{5c}\u{5b}"))  (re.++  (re.union  (str.to_re "\u{60}") (re.union  (str.to_re "\u{22}") (re.union  (str.to_re "\u{24}")  (str.to_re "\u{27}")))) (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{5c}")  (re.++  (str.to_re "\u{5c}\u{5c}") re.allchar)) )  (re.union  (str.to_re "\u{60}") (re.union  (str.to_re "\u{22}") (re.union  (str.to_re "\u{24}")  (str.to_re "\u{27}")))))))
))
(assert (= infix 
         (re.union  (str.to_re "\u{60}") (re.union  (str.to_re "\u{22}") (re.union  (str.to_re "\u{24}")  (str.to_re "\u{27}"))))  (re.union  (str.to_re "\u{60}") (re.union  (str.to_re "\u{22}") (re.union  (str.to_re "\u{24}")  (str.to_re "\u{27}"))))
))
(assert (= postfix 
        (str.to_re "")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)