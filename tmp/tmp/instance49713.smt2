;test regex \D*(\d{2})\D*(\d{2})\D*(\d{2})\D*(\d{2})\D*(\d{2})\D*
(declare-const X String)
(assert (str.in_re X (re.++ (re.* (re.diff re.allchar (re.range "0" "9"))) (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (re.++ (re.* (re.diff re.allchar (re.range "0" "9"))) (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (re.++ (re.* (re.diff re.allchar (re.range "0" "9"))) (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (re.++ (re.* (re.diff re.allchar (re.range "0" "9"))) (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (re.++ (re.* (re.diff re.allchar (re.range "0" "9"))) (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (re.* (re.diff re.allchar (re.range "0" "9")))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)