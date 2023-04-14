;test regex "((\\w|W){7,})"
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "\u{22}") (re.++ (re.++ (re.* (re.union (re.++ (str.to_re "\\") (str.to_re "w")) (str.to_re "W"))) ((_ re.loop 7 7) (re.union (re.++ (str.to_re "\\") (str.to_re "w")) (str.to_re "W")))) (str.to_re "\u{22}")))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)