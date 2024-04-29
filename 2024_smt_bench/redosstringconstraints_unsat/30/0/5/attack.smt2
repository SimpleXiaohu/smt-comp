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
        (re.inter (re.+  (re.union  (str.to_re "\u{5c}\u{2d}") (re.union  (str.to_re "\u{22}") (re.union  (str.to_re "\u{23}") (re.union (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_")) (re.union  (str.to_re "\u{5c}\u{27}")  (str.to_re "\u{2e}")))))) )  (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2d}") (re.union  (str.to_re "\u{22}") (re.union  (str.to_re "\u{23}") (re.union (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_")) (re.union  (str.to_re "\u{5c}\u{27}")  (str.to_re "\u{2e}")))))) ) (re.+  (re.union  (str.to_re "\u{25}") (re.union  (str.to_re "\u{2c}") (re.union  (str.to_re "\u{3d}")  (str.to_re "\u{7d}")))) )) (re.+  (re.union  (str.to_re "\u{25}") (re.union  (str.to_re "\u{2c}") (re.union  (str.to_re "\u{3d}")  (str.to_re "\u{7d}")))) ) )
))
(assert (= postfix 
         (re.inter  (re.++  (str.to_re "\u{22}") (re.++  (str.to_re "\u{00}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))) (re.comp (re.+  (re.union  (str.to_re "\u{25}") (re.union  (str.to_re "\u{2c}") (re.union  (str.to_re "\u{3d}")  (str.to_re "\u{7d}")))) )))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)