(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{76}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{71}") (re.++  (str.to_re "\u{75}") (re.++  (str.to_re "\u{65}")  (str.to_re "\u{7b}"))))))))
))
(assert (= infix 
         (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2d}") (re.union  (str.to_re "\u{5c}\u{22}") (re.union  (str.to_re "\u{5c}\u{23}") (re.union  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.union (re.range "\u{30}" "\u{39}")  (str.to_re "\u{5f}")))) (re.union  (str.to_re "\u{5c}\u{27}")  (str.to_re "\u{5c}\u{2e}")))))) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2d}") (re.union  (str.to_re "\u{5c}\u{22}") (re.union  (str.to_re "\u{5c}\u{23}") (re.union  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.union (re.range "\u{30}" "\u{39}")  (str.to_re "\u{5f}")))) (re.union  (str.to_re "\u{5c}\u{27}")  (str.to_re "\u{5c}\u{2e}")))))) ) (re.++  (re.+  (re.union  (str.to_re "\u{25}") (re.union  (str.to_re "\u{2c}") (re.union  (str.to_re "\u{3d}")  (str.to_re "\u{5c}\u{7d}")))) ))) (re.++  (str.to_re "\u{26}") (re.++ (re.+  (re.union  (str.to_re "\u{25}") (re.union  (str.to_re "\u{2c}") (re.union  (str.to_re "\u{3d}")  (str.to_re "\u{5c}\u{7d}")))) ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{7e}") (re.++  (str.to_re "\u{25}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{7e}")  (str.to_re "\u{25}"))))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)