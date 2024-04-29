(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{77}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{62}") (re.++  (str.to_re "\u{4f}") (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{50}") (re.++  (str.to_re "\u{31}") (re.++  (str.to_re "\u{36}") (re.++  (str.to_re "\u{30}") (re.++  (str.to_re "\u{55}")  (str.to_re "\u{2f}")))))))))))
))
(assert (= infix 
         (re.++  (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.+ (re.range "\u{30}" "\u{39}") )) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) (re.+ (re.range "\u{30}" "\u{39}") ))) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))
))
(assert (= postfix 
         (re.inter  (re.++  (str.to_re "\u{30}") (re.++  (str.to_re "\u{30}") (re.++  (str.to_re "\u{30}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) )))) (re.comp (re.+ (re.range "0" "9") )))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)