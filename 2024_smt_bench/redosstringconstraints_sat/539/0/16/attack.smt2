(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++ (re.opt  (re.union  (re.++  (str.to_re "\u{48}") (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{43}")  (str.to_re "\u{5c}\u{2f}"))))  (re.++  (str.to_re "\u{48}") (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{43}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) )  (str.to_re "\u{5c}\u{2f}"))))))) ) (re.++  (str.to_re "\u{48}") (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{43}") (re.opt  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union  (str.to_re "\u{3b}")  (str.to_re "\u{5f}")))) )))))  (re.inter (re.*  (str.to_re "\u{20}") )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))))
))
(assert (= infix 
         (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ))) (re.++  (str.to_re "\u{26}") (re.++ (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{31}")  (str.to_re "\u{0a}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)