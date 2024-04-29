(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (str.to_re "\u{61}")
))
(assert (= infix 
        (re.inter  (re.++ (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) ) (re.+  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{6e}") (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{5c}\u{74}") (re.union  (str.to_re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))))))) ))  (re.++ (re.+  (re.union  (str.to_re "\u{20}")  (str.to_re "\u{5c}\u{74}")) ) (re.+  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{6e}") (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{5c}\u{74}") (re.union  (str.to_re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))))))) )) )
))
(assert (= postfix 
        (re.inter  (re.inter  (re.++  (str.to_re "\u{09}") (re.++  (str.to_re "\u{20}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))) (re.comp (re.+  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{6e}") (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{5c}\u{74}") (re.union  (str.to_re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))))))) )))  (re.inter  (re.++  (str.to_re "\u{09}") (re.++  (str.to_re "\u{20}") (re.*  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))) ))) (re.comp  (re.++ (re.+  (re.union  (str.to_re "\u{20}") (re.union  (str.to_re "\u{5c}\u{6e}") (re.union  (str.to_re "\u{5c}\u{2f}") (re.union  (str.to_re "\u{5c}\u{74}") (re.union  (str.to_re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))))))) )  (re.++ (re.*  (str.to_re "\u{3d}") ) (re.* re.allchar ))))) )
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)