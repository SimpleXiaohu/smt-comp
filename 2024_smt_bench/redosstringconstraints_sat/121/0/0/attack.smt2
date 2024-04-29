(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
    (str.to_re "")
))
(assert (= infix 
        (re.inter  (re.++ (re.+ (re.range "0" "9") ) (re.+ (re.range "0" "9") ))  (re.++ (re.+ (re.range "0" "9") ) (re.++ (re.opt  (str.to_re "\u{5c}\u{2e}") ) (re.+ (re.range "0" "9") ))) )
))
(assert (= postfix 
        (re.inter  (re.inter  (re.++  (str.to_re "\u{30}") (re.++  (str.to_re "\u{30}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))) (re.comp (re.+ (re.range "0" "9") )))  (re.inter  (re.++  (str.to_re "\u{30}") (re.++  (str.to_re "\u{30}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))) (re.comp  (re.++ (re.+ (re.range "0" "9") )  (re.++ (re.*  (str.to_re "\u{20}") ) (re.opt  (re.union  (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6c}") (re.++  (str.to_re "\u{6c}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{63}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{64}") (re.opt  (str.to_re "\u{73}") )))))))))))) (re.union  (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{63}") (re.opt  (str.to_re "\u{73}") ))))) (re.union  (re.++  (str.to_re "\u{6d}")  (str.to_re "\u{73}")) (re.union  (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{63}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{64}") (re.opt  (str.to_re "\u{73}") ))))))) (re.union  (re.++  (str.to_re "\u{73}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{63}") (re.opt  (str.to_re "\u{73}") )))) (re.union  (str.to_re "\u{73}") (re.union  (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{75}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{65}") (re.opt  (str.to_re "\u{73}") ))))))) (re.union  (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{6e}") (re.opt  (str.to_re "\u{73}") )))) (re.union  (str.to_re "\u{6d}") (re.union  (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{75}") (re.++  (str.to_re "\u{72}") (re.opt  (str.to_re "\u{73}") ))))) (re.union  (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{72}") (re.opt  (str.to_re "\u{73}") ))) (re.union  (str.to_re "\u{68}") (re.union  (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{79}") (re.opt  (str.to_re "\u{73}") )))) (re.union  (str.to_re "\u{64}") (re.union  (re.++  (str.to_re "\u{79}") (re.++  (str.to_re "\u{65}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{72}") (re.opt  (str.to_re "\u{73}") ))))) (re.union  (re.++  (str.to_re "\u{79}") (re.++  (str.to_re "\u{72}") (re.opt  (str.to_re "\u{73}") )))  (str.to_re "\u{79}"))))))))))))))))) ))))) )
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)