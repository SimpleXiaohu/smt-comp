(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{53}") (re.++  (str.to_re "\u{6d}") (re.++  (str.to_re "\u{61}") (re.++  (str.to_re "\u{72}") (re.++  (str.to_re "\u{74}") (re.++  (str.to_re "\u{50}") (re.++  (str.to_re "\u{61}")  (str.to_re "\u{64}")))))))))
))
(assert (= infix 
        (re.inter  (re.++  (re.++ (re.range "0" "9") (re.range "0" "9")) (re.*  (re.++ (re.range "0" "9") (re.range "0" "9")) ))  (re.++  (re.++  (re.++ (re.range "0" "9") (re.range "0" "9")) (re.*  (re.++ (re.range "0" "9") (re.range "0" "9")) )) (re.+  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) )) (re.+  (re.union  (str.to_re "\u{5c}\u{2f}")  (str.to_re "\u{3b}")) ) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{25ce}") (re.++  (str.to_re "\u{3b}") (re.++  (str.to_re "\u{21}")  (str.to_re "\u{3b}"))))))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)