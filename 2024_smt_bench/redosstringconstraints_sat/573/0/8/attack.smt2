(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (re.++  (str.to_re "\u{4c}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{67}") (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6e}")  (str.to_re "\u{67}"))))))))) (re.++  (str.to_re "\u{5c}\u{2f}") (re.++ (re.+ (re.range "0" "9") )  (str.to_re "\u{5c}\u{2e}")))) (re.+ (re.range "0" "9") ))
))
(assert (= infix 
         (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++ (re.opt  (str.to_re "\u{5c}\u{2e}") ) (re.* (re.range "\u{30}" "\u{39}") ))) (re.++  (str.to_re "\u{26}") (re.++ (re.* (re.range "\u{30}" "\u{39}") ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (re.inter  (re.++  (str.to_re "\u{30}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )) (re.comp  (re.inter (re.* (re.range "0" "9") )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)