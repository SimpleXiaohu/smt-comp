(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 1510 1510) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{3b}") (re.*  (str.to_re "\u{20}") )) (re.+  (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{55}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{47}") (re.++  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{5f}"))) (re.*  (str.to_re "\u{20}") ))))))))) ))
))
(assert (= infix 
         (re.++ (re.+  (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{55}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{47}") (re.++  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{5f}"))) (re.*  (str.to_re "\u{20}") ))))))))) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{55}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{47}") (re.++  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{5f}"))) (re.*  (str.to_re "\u{20}") ))))))))) ) (re.++  (re.+  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ))) (re.++  (str.to_re "\u{26}") (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
        (str.to_re "")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)