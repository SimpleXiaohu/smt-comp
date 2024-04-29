(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{57}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{77}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{50}") (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{20}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{3b}")  (str.to_re "\u{20}")))))))))))))))))
))
(assert (= infix 
        (re.inter  (re.++ (re.* re.allchar ) (re.*  (str.to_re "\u{3b}") ))  (re.++ (re.* re.allchar ) (re.++  (re.++  (str.to_re "\u{49}") (re.++  (str.to_re "\u{45}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{62}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6c}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{5c}\u{2f}") (re.++ (re.+  (re.union  (str.to_re "\u{3b}")  (str.to_re "\u{5c}\u{29}")) ) (re.++  (re.union  (str.to_re "\u{3b}")  (str.to_re "\u{5c}\u{29}")) (re.++ (re.opt  (str.to_re "\u{20}") ) (re.++ (re.opt  (re.union  (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{52}") (re.++  (str.to_re "\u{4d}") (re.++  (str.to_re "\u{3b}") (re.++ (re.opt  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{75}") (re.++  (str.to_re "\u{63}") (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{3b}") (re.opt  (str.to_re "\u{20}") ))))))))))))  (re.++  (str.to_re "\u{54}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{75}") (re.++  (str.to_re "\u{63}") (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{3b}") (re.opt  (str.to_re "\u{20}") )))))))) )  (re.++  (str.to_re "\u{48}") (re.++  (str.to_re "\u{55}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{57}") (re.++  (str.to_re "\u{45}")  (str.to_re "\u{49}"))))))))))))))))))) (re.*  (str.to_re "\u{3b}") ))) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{41}")  (str.to_re "\u{3b}")))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)