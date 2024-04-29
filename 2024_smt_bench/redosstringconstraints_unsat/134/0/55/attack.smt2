(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 16 16) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{20}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{20}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{5c}\u{5b}") (re.++ (re.*  (str.to_re "\u{5c}\u{5d}") ) (re.++  (str.to_re "\u{5c}\u{5d}") (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{22}") (re.++ (re.+ (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")))) ) (re.++ (re.opt  (re.++ (re.+  (str.to_re "\u{20}") ) (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{22}")  (re.++  (str.to_re "\u{5c}\u{5c}") re.allchar)) ) (re.opt  (re.++ (re.+  (str.to_re "\u{20}") ) (re.* (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")))) )) ))) ) (re.++  (str.to_re "\u{22}") (re.++  (str.to_re "\u{20}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{20}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{22}") (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{22}")  (re.++  (str.to_re "\u{5c}\u{5c}") re.allchar)) ) (re.++  (str.to_re "\u{22}") (re.++  (str.to_re "\u{20}")  (str.to_re "\u{22}"))))))))))))))))))))))))  (re.union  (str.to_re "\u{5c}\u{22}")  (re.++  (str.to_re "\u{5c}\u{5c}") re.allchar)))
))
(assert (= infix 
         (re.inter  (re.++ (re.+  (str.to_re "\u{5c}\u{22}") ) (re.+  (re.++  (str.to_re "\u{5c}\u{5c}") re.allchar) )) (re.+  (re.++  (str.to_re "\u{5c}\u{5c}") re.allchar) )  (re.++  (str.to_re "\u{5c}\u{5c}") (re.* re.allchar )) ) 
))
(assert (= postfix 
         (str.to_re "\u{7e}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)