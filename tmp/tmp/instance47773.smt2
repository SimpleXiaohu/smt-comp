;test regex LAT_LON[^\da-zA-Z]*(\d{4}(?:\s+\d{4})*)
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "L") (re.++ (str.to_re "A") (re.++ (str.to_re "T") (re.++ (str.to_re "_") (re.++ (str.to_re "L") (re.++ (str.to_re "O") (re.++ (str.to_re "N") (re.++ (re.* (re.inter (re.diff re.allchar (re.range "0" "9")) (re.inter (re.diff re.allchar (re.range "a" "z")) (re.diff re.allchar (re.range "A" "Z"))))) (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.* (re.++ (re.+ (re.union (str.to_re " ") (re.union (str.to_re "\u{0b}") (re.union (str.to_re "\u{0a}") (re.union (str.to_re "\u{0d}") (re.union (str.to_re "\u{09}") (str.to_re "\u{0c}"))))))) ((_ re.loop 4 4) (re.range "0" "9")))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)