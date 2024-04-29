(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 5000 5000) infix) postfix)))
(assert (= prefix 
     (re.++  (str.to_re "\u{68}") (re.++  (str.to_re "\u{74}")  (str.to_re "\u{63}")))
))
(assert (= infix 
        (re.inter (re.+  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.union  (str.to_re "\u{3b}") (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{5f}")))) )  (re.++ (re.+  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.union  (str.to_re "\u{3b}") (re.union  (str.to_re "\u{5c}\u{2d}")  (str.to_re "\u{5f}")))) ) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_")) )) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_")) ) )
))
(assert (= postfix 
         (str.to_re "\u{40}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)