;test regex Regex.Match(l, @"\d{16}|\d{4}[- ]\d{4}[- ]\d{4}[- ]\d{4}")
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "R") (re.++ (str.to_re "e") (re.++ (str.to_re "g") (re.++ (str.to_re "e") (re.++ (str.to_re "x") (re.++ (re.diff re.allchar (str.to_re "\n")) (re.++ (str.to_re "M") (re.++ (str.to_re "a") (re.++ (str.to_re "t") (re.++ (str.to_re "c") (re.++ (str.to_re "h") (re.union (re.++ (str.to_re "l") (re.++ (str.to_re ",") (re.++ (str.to_re " ") (re.++ (str.to_re "@") (re.++ (str.to_re "\u{22}") ((_ re.loop 16 16) (re.range "0" "9"))))))) (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.++ (re.union (str.to_re "-") (str.to_re " ")) (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.++ (re.union (str.to_re "-") (str.to_re " ")) (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.++ (re.union (str.to_re "-") (str.to_re " ")) (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{22}"))))))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)