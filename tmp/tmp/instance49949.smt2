;test regex [computer]{3,8}
(declare-const X String)
(assert (str.in_re X ((_ re.loop 3 8) (re.union (str.to_re "c") (re.union (str.to_re "o") (re.union (str.to_re "m") (re.union (str.to_re "p") (re.union (str.to_re "u") (re.union (str.to_re "t") (re.union (str.to_re "e") (str.to_re "r")))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)