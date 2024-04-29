(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++ (re.opt  (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{5c}\u{2b}")) ) (re.+ (re.range "\u{31}" "\u{39}") ))
))
(assert (= infix 
        (re.inter (re.+ (re.range "\u{31}" "\u{39}") )  (re.++ (re.+ (re.range "\u{31}" "\u{39}") ) (re.* (re.range "\u{30}" "\u{39}") )) (re.* (re.range "\u{30}" "\u{39}") ) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{30}")  (str.to_re "\u{41}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)