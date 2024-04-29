(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 1024 1024) infix) postfix)))
(assert (= prefix 
     (re.++  (re.++ (re.+  (re.union  (str.to_re "\u{5c}\u{2f}") (re.range "\u{600}" "\u{6ff}")) ) (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) )) (re.+ (re.range "\u{600}" "\u{6ff}") ))
))
(assert (= infix 
        (re.inter  (re.union   (re.++ (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) ) (re.+ (re.range "\u{600}" "\u{6ff}") ))  (re.++  (re.++ (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) ) (re.+ (re.range "\u{600}" "\u{6ff}") ))    (re.++ (re.* (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) ) (re.+ (re.range "\u{600}" "\u{6ff}") )))) (re.+ (re.range "\u{600}" "\u{6ff}") ) )
))
(assert (= postfix 
         (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}") (re.++  (str.to_re "\u{41}") (re.++  (str.to_re "\u{21}")  (str.to_re "\u{41}")))))))))
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)