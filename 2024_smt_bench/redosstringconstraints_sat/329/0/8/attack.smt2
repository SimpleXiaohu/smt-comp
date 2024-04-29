(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{7a}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6c}") (re.++  (str.to_re "\u{6c}")  (str.to_re "\u{61}")))))))
))
(assert (= infix 
        (re.inter  (re.++ (re.+ re.allchar ) (re.+ (re.range "0" "9") ))  (re.++ (re.+ re.allchar ) (re.++  (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{64}") (re.++ (re.+ re.allchar ) (re.++  (re.++  (str.to_re "\u{47}") (re.++  (str.to_re "\u{53}")  (str.to_re "\u{41}")))  (str.to_re "\u{5c}\u{2f}")))))))))) (re.+ (re.range "0" "9") ))) )
))
(assert (= postfix 
        (re.inter  (re.inter  (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{47}") (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++  (str.to_re "\u{30}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))))))))))))))) (re.comp (re.+ (re.range "0" "9") )))  (re.inter  (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{00}") (re.++  (str.to_re "\u{47}") (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++  (str.to_re "\u{30}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))))))))))))))) (re.comp  (re.++ (re.+ (re.range "0" "9") )  (re.++  (str.to_re "\u{5c}\u{2e}") (re.++ (re.+ (re.range "0" "9") ) (re.++  (str.to_re "\u{5c}\u{2e}") (re.+ (re.range "0" "9") ))))))) )
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)