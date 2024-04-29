(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))  (str.to_re "\u{5f}")))  (re.++   (re.union  (str.to_re "\u{5c}\u{5c}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")))) (re.*   (re.union  (str.to_re "\u{5c}\u{5c}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")))) )))
))
(assert (= infix 
        (re.inter  (re.++   (re.union  (str.to_re "\u{5c}\u{5c}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")))) (re.*   (re.union  (str.to_re "\u{5c}\u{5c}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")))) ))  (re.++  (re.++   (re.union  (str.to_re "\u{5c}\u{5c}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")))) (re.*   (re.union  (str.to_re "\u{5c}\u{5c}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")))) )) (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) )) (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) ) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{0d}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{41}")  (str.to_re "\u{0d}"))))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)