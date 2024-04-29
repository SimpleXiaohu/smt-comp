(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 10000 10000) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++  (str.to_re "\u{3b}") (re.++ (re.*  (str.to_re "\u{20}") ) (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{49}") (re.++  (str.to_re "\u{52}") (re.++  (str.to_re "\u{49}") (re.++  (str.to_re "\u{53}") (re.opt  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{5f}"))) )))))))) (re.+  (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{3b}")  (str.to_re "\u{5c}\u{29}"))) ))
))
(assert (= infix 
        (re.inter (re.+  (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{3b}")  (str.to_re "\u{5c}\u{29}"))) )  (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{3b}")  (str.to_re "\u{5c}\u{29}"))) ) (re.*  (str.to_re "\u{20}") )) (re.*  (str.to_re "\u{20}") ) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{3b}")  (str.to_re "\u{25ce}")))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)