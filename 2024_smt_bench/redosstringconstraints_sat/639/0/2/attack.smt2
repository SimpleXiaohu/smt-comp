(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{49}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{47}")  (str.to_re "\u{5c}\u{2f}"))))) (re.+ (re.range "0" "9") ))
))
(assert (= infix 
        (re.inter (re.+ (re.range "0" "9") )  (re.++ (re.+ (re.range "0" "9") ) (re.++ re.allchar (re.+ (re.range "0" "9") ))) (re.+ (re.range "0" "9") ) )
))
(assert (= postfix 
         (re.inter  (re.++  (str.to_re "\u{30}") (re.++  (str.to_re "\u{30}") (re.++  (str.to_re "\u{30}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))) (re.comp (re.+ (re.range "0" "9") )))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)