;test regex r"\{\\(?:fad|fade)\(\d{1,4},\d{1,4}\)\}"
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (str.to_re "r") (re.++ (str.to_re "\u{22}") (re.++ (str.to_re "{") (re.++ (str.to_re "\\") (re.++ (re.union (re.++ (str.to_re "f") (re.++ (str.to_re "a") (str.to_re "d"))) (re.++ (str.to_re "f") (re.++ (str.to_re "a") (re.++ (str.to_re "d") (str.to_re "e"))))) (re.++ (str.to_re "(") ((_ re.loop 1 4) (re.range "0" "9")))))))) (re.++ (str.to_re ",") (re.++ ((_ re.loop 1 4) (re.range "0" "9")) (re.++ (str.to_re ")") (re.++ (str.to_re "}") (str.to_re "\u{22}"))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)