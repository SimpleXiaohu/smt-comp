(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{6e}") (re.++  (str.to_re "\u{64}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{6f}") (re.++  (str.to_re "\u{69}") (re.++  (str.to_re "\u{64}") (re.++  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{2d}")) (re.++ (re.+ (re.range "0" "9") ) (re.++  (re.union   (re.++  (str.to_re "\u{5c}\u{2e}") (re.+ (re.range "0" "9") ))  (re.++  (re.++  (str.to_re "\u{5c}\u{2e}") (re.+ (re.range "0" "9") ))    (re.++  (str.to_re "\u{5c}\u{2e}") (re.+ (re.range "0" "9") )))) (re.++ (re.opt  (re.++  (str.to_re "\u{3b}") (re.* re.allchar )) )  (str.to_re "\u{3b}"))))))))))))  (re.inter (re.*  (str.to_re "\u{20}") )  (re.++   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) (re.*   (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))))
))
(assert (= infix 
        (re.inter (re.*  (str.to_re "\u{20}") )  (re.++ (re.*  (str.to_re "\u{20}") ) (re.+ re.allchar )) (re.+ re.allchar ) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{0a}") (re.++  (str.to_re "\u{25ce}")  (str.to_re "\u{0a}"))))))))))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)