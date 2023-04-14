;test regex @"[+-]?\d+(\R.\d{0,2})?"
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "@") (re.++ (str.to_re "\u{22}") (re.++ (re.opt (re.union (str.to_re "+") (str.to_re "-"))) (re.++ (re.+ (re.range "0" "9")) (re.++ (re.opt (re.++ (str.to_re "R") (re.++ (re.diff re.allchar (str.to_re "\n")) ((_ re.loop 0 2) (re.range "0" "9"))))) (str.to_re "\u{22}"))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)