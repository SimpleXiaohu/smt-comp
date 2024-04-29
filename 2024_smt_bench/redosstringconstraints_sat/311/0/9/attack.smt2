(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{7a}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6c}") (re.++  (str.to_re "\u{6c}")  (str.to_re "\u{61}")))))))
))
(assert (= infix 
        (re.inter  (re.++ (re.* re.allchar ) (re.+ (re.range "0" "9") ))  (re.++ (re.* re.allchar ) (re.++  (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{62}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6c}") (re.++  (str.to_re "\u{65}") (re.++ (re.* re.allchar ) (re.++  (re.++  (str.to_re "\u{49}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{67}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{61}")  (str.to_re "\u{6d}"))))))))) re.allchar)))))))) (re.+ (re.range "0" "9") ))) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{0a}")  (str.to_re "\u{21}"))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)