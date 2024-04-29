(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{48}") (re.++  (str.to_re "\u{62}") (re.++  (str.to_re "\u{62}") (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{56}") (re.++  (str.to_re "\u{2f}") (re.++  (str.to_re "\u{31}") (re.++ re.allchar (re.++  (str.to_re "\u{31}") (re.++ re.allchar  (str.to_re "\u{31}")))))))))))
))
(assert (= infix 
         (re.++ (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (re.++  (str.to_re "\u{43}") (re.++  (str.to_re "\u{45}") (re.++  (str.to_re "\u{2d}") (re.++  (str.to_re "\u{48}") (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{4c}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++  (str.to_re "\u{31}") (re.++  (str.to_re "\u{5c}\u{2e}") (re.++ (re.range "\u{30}" "\u{39}") (re.++  (str.to_re "\u{3b}") (re.++ (re.*  (re.++  (str.to_re "\u{56}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{72}")  (str.to_re "\u{5c}\u{2f}"))))))) ) (re.++  (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{48}") (re.++  (str.to_re "\u{4f}") (re.++  (str.to_re "\u{4d}") (re.*  (str.to_re "\u{3b}") )))))  (re.union  (re.union  (str.to_re "\u{0c}") (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{0a}") (re.union  (str.to_re "\u{0d}") (re.union  (str.to_re "\u{09}")  (str.to_re "\u{0b}"))))))  (str.to_re "\u{3b}")))))))))))))))) (re.*  (re.++ (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{57}") (re.++  (str.to_re "\u{2d}") (re.++  (str.to_re "\u{56}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ))))))))))))) ))) (re.++  (str.to_re "\u{26}") (re.++ (re.*  (re.++ (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{57}") (re.++  (str.to_re "\u{2d}") (re.++  (str.to_re "\u{56}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ))))))))))))) ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (str.to_re "\u{40}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)