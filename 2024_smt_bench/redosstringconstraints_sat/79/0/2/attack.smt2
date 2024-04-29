(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{6e}")  (str.to_re "\u{74}")))))))
))
(assert (= infix 
        (re.inter  (re.++ (re.+ re.allchar ) (re.+  (re.union  (str.to_re "\u{5c}\u{2e}") (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_"))) ))  (re.++ (re.+ re.allchar ) (re.++  (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{76}")  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))  (str.to_re "\u{3a}")))) (re.+  (re.union  (str.to_re "\u{5c}\u{2e}") (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_"))) ))) )
))
(assert (= postfix 
        (re.inter  (re.inter  (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{76}") (re.++  (str.to_re "\u{09}") (re.++  (str.to_re "\u{41}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))))) (re.comp (re.+  (re.union  (str.to_re "\u{5c}\u{2e}") (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_"))) )))  (re.inter  (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{76}") (re.++  (str.to_re "\u{09}") (re.++  (str.to_re "\u{41}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))))) (re.comp  (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2e}") (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_"))) )  (re.++ (re.+ re.allchar ) (re.++  (str.to_re "\u{6c}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6b}") (re.++  (str.to_re "\u{65}") (re.++ (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.++  (str.to_re "\u{67}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{63}") (re.++  (str.to_re "\u{6b}")  (str.to_re "\u{6f}")))))))))))))) )
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)