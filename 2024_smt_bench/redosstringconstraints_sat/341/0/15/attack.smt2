(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{50}") (re.++  (str.to_re "\u{6f}")  (str.to_re "\u{64}"))))
))
(assert (= infix 
         (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.+ (re.range "\u{30}" "\u{39}") )) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (re.++  (str.to_re "\u{56}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") )  (str.to_re "\u{5c}\u{2e}")))))))))) (re.+ (re.range "\u{30}" "\u{39}") ))) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))
))
(assert (= postfix 
        (re.inter  (re.inter  (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{56}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++  (str.to_re "\u{30}") (re.++  (str.to_re "\u{5c}\u{2e}") (re.++  (str.to_re "\u{30}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))))))))))))) (re.comp (re.+ (re.range "0" "9") )))  (re.inter  (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{56}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++  (str.to_re "\u{30}") (re.++  (str.to_re "\u{5c}\u{2e}") (re.++  (str.to_re "\u{30}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))))))))))))) (re.comp  (re.++ (re.+ (re.range "0" "9") )  (re.++ (re.opt  (re.++  (str.to_re "\u{5c}\u{2e}") (re.+ (re.range "0" "9") )) ) (re.++ (re.* re.allchar ) (re.++  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{2b}")) (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{66}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{72}")  (str.to_re "\u{69}")))))))))))) )
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)