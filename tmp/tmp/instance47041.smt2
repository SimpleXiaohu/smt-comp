;test regex [A-Z]{4} \d{3}([^A-Z]{4}){4,40} \(\d\)
(declare-const X String)
(assert (str.in_re X (re.++ ((_ re.loop 4 4) (re.range "A" "Z")) (re.++ (str.to_re " ") (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.++ ((_ re.loop 4 40) ((_ re.loop 4 4) (re.diff re.allchar (re.range "A" "Z")))) (re.++ (str.to_re " ") (re.++ (str.to_re "(") (re.++ (re.range "0" "9") (str.to_re ")"))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)