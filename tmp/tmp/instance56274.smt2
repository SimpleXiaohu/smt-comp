;test regex (\[XpTo\(")([A-Z]{1}[a-z]+)+
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (str.to_re "[") (re.++ (str.to_re "X") (re.++ (str.to_re "p") (re.++ (str.to_re "T") (re.++ (str.to_re "o") (re.++ (str.to_re "(") (str.to_re "\u{22}"))))))) (re.+ (re.++ ((_ re.loop 1 1) (re.range "A" "Z")) (re.+ (re.range "a" "z")))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)