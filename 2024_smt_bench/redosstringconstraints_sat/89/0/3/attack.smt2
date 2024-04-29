(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{69}")  (str.to_re "\u{64}"))))))) (re.+ re.allchar ))
))
(assert (= infix 
         (re.++ (re.+  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (re.+  (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (re.union  (str.to_re "\u{0c}") (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}") (re.union  (str.to_re "\u{0d}") (re.union  (str.to_re "\u{09}")  (str.to_re "\u{0b}"))))))  (str.to_re "\u{3b}"))) ))) (re.++  (str.to_re "\u{26}") (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (re.union  (str.to_re "\u{0c}") (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}") (re.union  (str.to_re "\u{0d}") (re.union  (str.to_re "\u{09}")  (str.to_re "\u{0b}"))))))  (str.to_re "\u{3b}"))) ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{41}")  (str.to_re "\u{21}"))))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)