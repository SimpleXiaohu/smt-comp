(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{3a}")  (re.++ (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_")) ) (re.++  (str.to_re "\u{5c}\u{2f}") (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_")) ))))))))  (re.inter (re.*  (str.to_re "\u{3b}") )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))))
))
(assert (= infix 
         (re.++ (re.*  (str.to_re "\u{3b}") ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.*  (str.to_re "\u{3b}") ) (re.++ (re.*  (re.++  (str.to_re "\u{63}") (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{3d}") (re.*  (re.union  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.union (re.range "\u{30}" "\u{39}")  (str.to_re "\u{5f}")))) (re.union  (str.to_re "\u{3d}")  (str.to_re "\u{5c}\u{2d}"))) ))))))))) ) (re.*  (str.to_re "\u{3b}") ))) (re.++  (str.to_re "\u{26}") (re.++ (re.*  (str.to_re "\u{3b}") ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
        (str.to_re "")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)