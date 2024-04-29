(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (re.++  (str.to_re "\u{44}") (re.++  (str.to_re "\u{61}")  (str.to_re "\u{72}"))) (re.++  (re.++  (str.to_re "\u{77}") (re.++  (str.to_re "\u{69}")  (str.to_re "\u{6e}"))) (re.++  (str.to_re "\u{5c}\u{2f}") (re.++  (re.++  (str.to_re "\u{31}")  (str.to_re "\u{33}")) re.allchar)))) (re.+ (re.range "0" "9") ))
))
(assert (= infix 
        (re.inter (re.+ (re.range "0" "9") )  (re.++ (re.+ (re.range "0" "9") ) (re.* re.allchar )) (re.* re.allchar ) )
))
(assert (= postfix 
         (str.to_re "\u{40}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)