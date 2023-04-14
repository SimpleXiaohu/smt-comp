;test regex "(?:^\[.+?\]$)|(?:^[INTEX]{3}\. .+?$)"
(declare-const X String)
(assert (str.in_re X (re.union (re.++ (str.to_re "\u{22}") (re.++ (re.++ (str.to_re "") (re.++ (str.to_re "[") (re.++ (re.+ (re.diff re.allchar (str.to_re "\n"))) (str.to_re "]")))) (str.to_re ""))) (re.++ (re.++ (re.++ (str.to_re "") (re.++ ((_ re.loop 3 3) (re.union (str.to_re "I") (re.union (str.to_re "N") (re.union (str.to_re "T") (re.union (str.to_re "E") (str.to_re "X")))))) (re.++ (str.to_re ".") (re.++ (str.to_re " ") (re.+ (re.diff re.allchar (str.to_re "\n"))))))) (str.to_re "")) (str.to_re "\u{22}")))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)