(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 32 32) infix) postfix)))
(assert (= prefix 
     (re.++ (re.opt  (str.to_re "\u{5c}\u{2f}") ) (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{41}" "\u{5a}")  (str.to_re "\u{5f}")))) ))
))
(assert (= infix 
        (re.inter (re.+  (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{41}" "\u{5a}")  (str.to_re "\u{5f}")))) ) (re.opt  (str.to_re "\u{5c}\u{2f}") )) ) (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{41}" "\u{5a}")  (str.to_re "\u{5f}")))) ) )
))
(assert (= postfix 
        (re.inter  (re.inter  (re.++  (str.to_re "\u{41}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )) (re.comp (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{41}" "\u{5a}")  (str.to_re "\u{5f}")))) )))  (re.inter  (re.++  (str.to_re "\u{41}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )) (re.comp  (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{41}" "\u{5a}")  (str.to_re "\u{5f}")))) ) (re.opt  (str.to_re "\u{5c}\u{2f}") )))) )
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)