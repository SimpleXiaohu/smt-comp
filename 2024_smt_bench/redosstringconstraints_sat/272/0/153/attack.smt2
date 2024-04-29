(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 128 128) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{48}") (re.++  (str.to_re "\u{62}") (re.++  (str.to_re "\u{62}") (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{56}") (re.++  (str.to_re "\u{2f}") (re.++  (str.to_re "\u{31}") (re.++ re.allchar (re.++  (str.to_re "\u{31}") (re.++ re.allchar (re.++  (str.to_re "\u{31}") (re.++  (str.to_re "\u{43}") (re.++  (str.to_re "\u{45}") (re.++  (str.to_re "\u{2d}") (re.++  (str.to_re "\u{48}") (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{4c}") (re.++  (str.to_re "\u{2f}") (re.++  (str.to_re "\u{31}") (re.++ re.allchar (re.++  (str.to_re "\u{31}") (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{48}") (re.++  (str.to_re "\u{4f}") (re.++  (str.to_re "\u{4d}")  (str.to_re "\u{3b}"))))))))))))))))))))))))))))
))
(assert (= infix 
        (re.inter  (re.++ (re.* re.allchar ) (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{57}") (re.++  (str.to_re "\u{2d}") (re.++  (str.to_re "\u{56}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{69}")  (str.to_re "\u{6f}"))))))))))  (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.* re.allchar ))) )
))
(assert (= postfix 
         (str.to_re "\u{40}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)