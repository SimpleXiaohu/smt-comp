;test regex new Regex("^([a-z]{1,25}|[A-Z]{1,25})$")
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "n") (re.++ (str.to_re "e") (re.++ (str.to_re "w") (re.++ (str.to_re " ") (re.++ (str.to_re "R") (re.++ (str.to_re "e") (re.++ (str.to_re "g") (re.++ (str.to_re "e") (re.++ (str.to_re "x") (re.++ (re.++ (str.to_re "\u{22}") (re.++ (str.to_re "") (re.union ((_ re.loop 1 25) (re.range "a" "z")) ((_ re.loop 1 25) (re.range "A" "Z"))))) (re.++ (str.to_re "") (str.to_re "\u{22}"))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)