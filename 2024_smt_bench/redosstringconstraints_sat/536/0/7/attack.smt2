(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{75}")  (str.to_re "\u{73}"))))
))
(assert (= infix 
        (re.inter  (re.++ (re.* re.allchar ) (re.*  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{3b}"))) ))  (re.++ (re.* re.allchar ) (re.++  (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{55}")  (str.to_re "\u{53}")))) (re.*  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{3b}"))) ))) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{7e}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{41}")  (str.to_re "\u{7e}"))))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)