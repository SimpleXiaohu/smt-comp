;test regex ^(3[0-5][0-9]|[12][0-9]{2}|[1-9]?[0-9])[0-5][0-9]'[0-5][0-9](,[0-9]+)?''$
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (str.to_re "") (re.++ (re.union (re.union (re.++ (str.to_re "3") (re.++ (re.range "0" "5") (re.range "0" "9"))) (re.++ (str.to_re "12") ((_ re.loop 2 2) (re.range "0" "9")))) (re.++ (re.opt (re.range "1" "9")) (re.range "0" "9"))) (re.++ (re.range "0" "5") (re.++ (re.range "0" "9") (re.++ (str.to_re "\u{27}") (re.++ (re.range "0" "5") (re.++ (re.range "0" "9") (re.++ (re.opt (re.++ (str.to_re ",") (re.+ (re.range "0" "9")))) (re.++ (str.to_re "\u{27}") (str.to_re "\u{27}")))))))))) (str.to_re ""))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)