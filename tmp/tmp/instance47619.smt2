;test regex [bcdfgjklmnpqrtvwxz]{5}
(declare-const X String)
(assert (str.in_re X ((_ re.loop 5 5) (re.union (str.to_re "b") (re.union (str.to_re "c") (re.union (str.to_re "d") (re.union (str.to_re "f") (re.union (str.to_re "g") (re.union (str.to_re "j") (re.union (str.to_re "k") (re.union (str.to_re "l") (re.union (str.to_re "m") (re.union (str.to_re "n") (re.union (str.to_re "p") (re.union (str.to_re "q") (re.union (str.to_re "r") (re.union (str.to_re "t") (re.union (str.to_re "v") (re.union (str.to_re "w") (re.union (str.to_re "x") (str.to_re "z")))))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)