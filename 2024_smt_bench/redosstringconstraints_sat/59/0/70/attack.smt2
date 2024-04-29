(set-logic QF_SLIA)
(declare-const result String)
(declare-const attack String)
(declare-const prefix RegLan)
(declare-const infix RegLan)
(declare-const postfix RegLan)
(declare-const postfixs String)

(assert (str.in_re attack (re.++ prefix ((_ re.loop 32 32) infix) postfix)))
(assert (= prefix 
     (re.++  (re.union  (str.to_re "\u{22}")  (str.to_re "\u{27}"))  (re.union  (re.++  (str.to_re "\u{5c}\u{24}") (re.++  (str.to_re "\u{5c}\u{7b}") (re.++ (re.+  (re.union  (re.union  (str.to_re "\u{22}") (re.union  (str.to_re "\u{27}")  (str.to_re "\u{7d}")))  (re.++  (re.union  (str.to_re "\u{22}")  (str.to_re "\u{27}")) (re.++ (re.*  (re.union  (str.to_re "\u{5c}\u{5c}")  (re.++  (str.to_re "\u{5c}\u{5c}")  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " "))))))) )  (re.union  (str.to_re "\u{22}")  (str.to_re "\u{27}"))))) )  (str.to_re "\u{5c}\u{7d}")))) (re.union  (str.to_re "\u{5c}\u{5c}")  (re.++  (str.to_re "\u{5c}\u{5c}")  (re.union (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")) (re.inter re.allchar (re.comp (re.union (str.to_re "\u{09}") (str.to_re "\u{0a}") (str.to_re "\u{0d}") (str.to_re " ")))))))))
))
(assert (= infix 
         (re.++  (re.++  (str.to_re "\u{7b}") (re.++  (re.++  (str.to_re "\u{7b}") (re.++  (str.to_re "\u{22}") (re.++  (str.to_re "\u{22}")  (str.to_re "\u{7d}")))))))
))
(assert (= postfix 
         (str.to_re "\u{41}")
))
(assert (str.in_re postfixs postfix))
(assert (>= (str.len postfixs) 1))
(assert (= result (str.++ attack postfixs)))
(check-sat)
(get-model)