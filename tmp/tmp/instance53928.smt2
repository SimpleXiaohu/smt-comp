;test regex "[A-Z]{1}[a-z]{2}\\d{1,}"
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "\u{22}") (re.++ ((_ re.loop 1 1) (re.range "A" "Z")) (re.++ ((_ re.loop 2 2) (re.range "a" "z")) (re.++ (str.to_re "\\") (re.++ (re.++ (re.* (str.to_re "d")) ((_ re.loop 1 1) (str.to_re "d"))) (str.to_re "\u{22}"))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)