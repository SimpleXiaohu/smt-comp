(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (re.++  (str.to_re "\u{4c}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{75}")  (str.to_re "\u{78}"))))) (re.++  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{2f}")) (re.++ (re.+ (re.range "0" "9") ) (re.++  (str.to_re "\u{5c}\u{2e}") (re.++ (re.+ (re.range "0" "9") )  (str.to_re "\u{5c}\u{2e}")))))) (re.+ (re.range "0" "9") ))
))
(assert (= infix 
         (re.++  (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) )) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (re.*  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ))) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{21}")  (str.to_re "\u{0a}"))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)