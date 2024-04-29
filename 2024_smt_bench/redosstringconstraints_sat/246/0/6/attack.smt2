(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 1010 1010) infix) postfix)))
(assert (= prefix 
     (str.to_re "\u{3b}")
))
(assert (= infix 
         (re.++ (re.+  (re.union  (re.++ (re.opt  (str.to_re "\u{3d}") ) (re.++  (re.union  (str.to_re "\u{4c}")  (str.to_re "\u{6c}")) (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{76}") (re.++  (str.to_re "\u{6f}") (re.opt  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{5f}"))) ))))))))  (re.++  (str.to_re "\u{4c}") (re.++  (str.to_re "\u{45}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{4f}") (re.++  (str.to_re "\u{56}") (re.++  (str.to_re "\u{4f}")  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5f}"))))))))) ) (re.++  (str.to_re "\u{26}") (re.++  (re.++ (re.+  (re.union  (re.++ (re.opt  (str.to_re "\u{3d}") ) (re.++  (re.union  (str.to_re "\u{4c}")  (str.to_re "\u{6c}")) (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{76}") (re.++  (str.to_re "\u{6f}") (re.opt  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{5f}"))) ))))))))  (re.++  (str.to_re "\u{4c}") (re.++  (str.to_re "\u{45}") (re.++  (str.to_re "\u{4e}") (re.++  (str.to_re "\u{4f}") (re.++  (str.to_re "\u{56}") (re.++  (str.to_re "\u{4f}")  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5f}"))))))))) ) (re.++  (re.+  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ))) (re.++  (str.to_re "\u{26}") (re.++ (re.+  (re.union  (str.to_re "\u{0a}")  (str.to_re "\u{0d}")) ) (re.++  (str.to_re "\u{26}") (re.+ re.allchar )))))))
))
(assert (= postfix 
         (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{41}")  (str.to_re "\u{0a}"))))))))))))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)