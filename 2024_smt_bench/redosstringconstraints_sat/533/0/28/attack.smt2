(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{43}") (re.++  (str.to_re "\u{46}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{77}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{6b}")  (str.to_re "\u{2f}"))))))))))
))
(assert (= infix 
        (re.inter  (re.++ (re.* re.allchar ) (re.+ (re.range "0" "9") ))  (re.++ (re.* re.allchar ) (re.++  (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{44}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{77}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++ (re.range "0" "9") (re.++ (re.* re.allchar ) (re.++  (str.to_re "\u{5c}\u{28}") (re.++  (re.++  (re.union  (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{61}")  (str.to_re "\u{63}"))) (re.union  (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{61}")  (str.to_re "\u{63}")))) (re.union  (re.++  (str.to_re "\u{50}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{77}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{61}")  (str.to_re "\u{63}"))))))))  (re.++  (str.to_re "\u{50}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{77}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{42}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6f}")  (str.to_re "\u{6b}")))))))))))) (re.* (re.range "0" "9") )) (re.++ (re.+ (re.range "0" "9") )  (re.union  (str.to_re "\u{2c}")  (re.++  (str.to_re "\u{25}") (re.++  (str.to_re "\u{32}")  (str.to_re "\u{43}"))))))))))))))))) (re.+ (re.range "0" "9") ))) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{30}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{30}")  (str.to_re "\u{21}"))))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)