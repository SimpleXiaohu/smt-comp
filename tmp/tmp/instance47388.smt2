;test regex r"^[a-zA-Z][a-zA-Z0-9\.\-]{1,28}[a-zA-Z0-9]$"
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (re.++ (str.to_re "r") (str.to_re "\u{22}")) (re.++ (str.to_re "") (re.++ (re.union (re.range "a" "z") (re.range "A" "Z")) (re.++ ((_ re.loop 1 28) (re.union (re.range "a" "z") (re.union (re.range "A" "Z") (re.union (re.range "0" "9") (re.union (str.to_re ".") (str.to_re "-")))))) (re.union (re.range "a" "z") (re.union (re.range "A" "Z") (re.range "0" "9"))))))) (re.++ (str.to_re "") (str.to_re "\u{22}")))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)