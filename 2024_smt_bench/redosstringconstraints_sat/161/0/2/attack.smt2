(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (str.to_re "\u{25}")
))
(assert (= infix 
        (re.inter  (re.++ (re.*  (re.union  (str.to_re "\u{30}") (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union  (str.to_re "\u{5c}\u{23}")  (str.to_re "\u{2b}"))))) ) (re.+ (re.range "0" "9") ))  (re.++ (re.*  (re.union  (str.to_re "\u{30}") (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{2d}") (re.union  (str.to_re "\u{5c}\u{23}")  (str.to_re "\u{2b}"))))) ) (re.+ (re.range "0" "9") )) )
))
(assert (= postfix 
         (str.to_re "\u{25ce}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)