(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (re.union  (re.++  (str.to_re "\u{43}") (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{72}")  (str.to_re "\u{61}"))))))) (re.union  (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{6b}") (re.++  (str.to_re "\u{65}")  (str.to_re "\u{79}"))))))))) (re.union  (re.++  (str.to_re "\u{43}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6e}")  (str.to_re "\u{6f}"))))))  (re.++  (str.to_re "\u{57}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{66}") (re.++  (str.to_re "\u{6f}")  (str.to_re "\u{78}"))))))))))) (re.++  (str.to_re "\u{5c}\u{2f}") (re.++ (re.+ (re.range "0" "9") )  (str.to_re "\u{5c}\u{2e}")))) (re.+ (re.range "0" "9") ))
))
(assert (= infix 
        (re.inter  (re.++ (re.+ (re.range "0" "9") ) (re.+ (re.range "0" "9") ))  (re.++ (re.+ (re.range "0" "9") ) (re.++  (re.++ (re.opt  (str.to_re "\u{5c}\u{2e}") ) (re.opt  (re.union  (str.to_re "\u{61}")  (str.to_re "\u{62}")) )) (re.+ (re.range "0" "9") ))) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}")  (str.to_re "\u{41}"))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)