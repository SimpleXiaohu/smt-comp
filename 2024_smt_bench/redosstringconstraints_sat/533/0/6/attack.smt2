(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{43}") (re.++  (str.to_re "\u{46}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{77}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{6b}")  (str.to_re "\u{5c}\u{2f}"))))))))))  (re.inter (re.* re.allchar )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))))
))
(assert (= infix 
         (re.++  (re.++ (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) )) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{44}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{77}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.range "\u{30}" "\u{39}"))))))))) (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ))) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{31}")  (str.to_re "\u{21}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)