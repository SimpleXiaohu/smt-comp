(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{3b}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (re.union  (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{43}")  (str.to_re "\u{48}"))) (re.union  (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{47}")  (str.to_re "\u{48}"))) (re.union  (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{48}")  (str.to_re "\u{56}"))) (re.union  (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{48}")  (str.to_re "\u{57}"))) (re.union  (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{50}")  (str.to_re "\u{48}"))) (re.union  (re.++  (str.to_re "\u{53}")  (str.to_re "\u{43}"))  (re.++  (str.to_re "\u{53}")  (str.to_re "\u{4d}"))))))))  (str.to_re "\u{5c}\u{2d}")))) (re.+  (re.union  (str.to_re "\u{20}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))) ))
))
(assert (= infix 
         (re.++ (re.+  (re.union  (str.to_re "\u{20}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{20}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))) ) (re.++ (re.opt  (str.to_re "\u{5c}\u{2f}") ) (re.*  (str.to_re "\u{20}") ))) (re.++  (str.to_re "\u{26}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
        (str.to_re "")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)