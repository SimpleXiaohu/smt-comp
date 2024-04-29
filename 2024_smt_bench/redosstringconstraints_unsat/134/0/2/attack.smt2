(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 32 32) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{20}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{20}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{5c}\u{5b}") (re.++ (re.*  (str.to_re "\u{5c}\u{5d}") ) (re.++  (str.to_re "\u{5c}\u{5d}") (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{22}") (re.++ (re.+ (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")))) ) (re.+  (str.to_re "\u{20}") )))))))))))))  (re.union  (str.to_re "\u{5c}\u{22}")  (re.++  (str.to_re "\u{5c}\u{5c}") re.allchar)))
))
(assert (= infix 
         (re.inter  (re.++ (re.+  (re.++  (str.to_re "\u{5c}\u{5c}") re.allchar) ) (re.+  (str.to_re "\u{5c}\u{22}") )) (re.+  (str.to_re "\u{5c}\u{22}") )  (re.++  (str.to_re "\u{5c}\u{5c}") (re.* re.allchar )) ) 
))
(assert (= postfix 
        (re.inter  (re.inter  (re.++  (str.to_re "\u{5c}\u{5c}") (re.++  (str.to_re "\u{5c}\u{5c}") (re.++  (str.to_re "\u{00}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))) (re.comp  (re.inter (re.*  (re.union  (str.to_re "\u{5c}\u{22}")  (re.++  (str.to_re "\u{5c}\u{5c}") re.allchar)) )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))))  (re.inter  (re.++  (str.to_re "\u{5c}\u{5c}") (re.++  (str.to_re "\u{5c}\u{5c}") (re.++  (str.to_re "\u{00}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))) (re.comp  (re.++  (re.inter (re.*  (re.union  (str.to_re "\u{5c}\u{22}")  (re.++  (str.to_re "\u{5c}\u{5c}") re.allchar)) )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))  (re.++ (re.opt  (re.++ (re.+  (str.to_re "\u{20}") ) (re.* (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")))) )) ) (re.++  (str.to_re "\u{22}") (re.++  (str.to_re "\u{20}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{20}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.opt  (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{22}") (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{22}")  (re.++  (str.to_re "\u{5c}\u{5c}") re.allchar)) ) (re.++  (str.to_re "\u{22}") (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{22}") (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{22}")  (re.++  (str.to_re "\u{5c}\u{5c}") re.allchar)) )  (str.to_re "\u{22}")))))))) )))))))))) )
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)