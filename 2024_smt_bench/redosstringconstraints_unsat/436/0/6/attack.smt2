(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{3b}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (re.union  (re.++  (str.to_re "\u{46}") (re.++  (str.to_re "\u{6c}")  (str.to_re "\u{79}")))  (re.++  (str.to_re "\u{46}") (re.++  (str.to_re "\u{4c}")  (str.to_re "\u{59}")))) (re.++  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5f}")) (re.++  (str.to_re "\u{46}")  (re.union  (str.to_re "\u{33}")  (str.to_re "\u{34}"))))))) (re.+ (re.range "0" "9") ))
))
(assert (= infix 
        (re.inter  (re.++ (re.+ (re.range "0" "9") ) (re.*  (str.to_re "\u{3b}") ))  (re.++ (re.+ (re.range "0" "9") ) (re.*  (str.to_re "\u{3b}") )) )
))
(assert (= postfix 
        (str.to_re "")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)