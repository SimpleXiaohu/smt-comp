;test regex ^Armadale\D+\d{2}-\d{3}-\d{2}\D+2\d{4}\D+$
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (str.to_re "") (re.++ (str.to_re "A") (re.++ (str.to_re "r") (re.++ (str.to_re "m") (re.++ (str.to_re "a") (re.++ (str.to_re "d") (re.++ (str.to_re "a") (re.++ (str.to_re "l") (re.++ (str.to_re "e") (re.++ (re.+ (re.diff re.allchar (re.range "0" "9"))) (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (re.++ (str.to_re "-") (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.++ (str.to_re "-") (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (re.++ (re.+ (re.diff re.allchar (re.range "0" "9"))) (re.++ (str.to_re "2") (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.+ (re.diff re.allchar (re.range "0" "9"))))))))))))))))))))) (str.to_re ""))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)