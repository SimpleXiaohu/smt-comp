(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{3b}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (re.++  (re.union  (str.to_re "\u{69}")  (str.to_re "\u{49}")) (re.++  (str.to_re "\u{42}") (re.++  (str.to_re "\u{75}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{64}")  (str.to_re "\u{79}")))))) (re.++ (re.opt  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5f}")) ) (re.++  (re.++  (str.to_re "\u{43}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{63}")  (str.to_re "\u{74}"))))))) (re.opt  (re.union  (str.to_re "\u{5f}") (re.union  (re.++  (str.to_re "\u{5c}\u{3f}")  (str.to_re "\u{5f}"))  (str.to_re "\u{20}"))) ))))))  (re.inter (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))))
))
(assert (= infix 
         (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ) (re.++  (re.*  (str.to_re "\u{20}") ))) (re.++  (str.to_re "\u{26}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{3b}")  (str.to_re "\u{25ce}")))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)