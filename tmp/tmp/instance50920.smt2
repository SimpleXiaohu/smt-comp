;test regex Regex.IsMatch(culture, @"^[a-z]{2}(-[A-Z]{2})*$")
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "R") (re.++ (str.to_re "e") (re.++ (str.to_re "g") (re.++ (str.to_re "e") (re.++ (str.to_re "x") (re.++ (re.diff re.allchar (str.to_re "\n")) (re.++ (str.to_re "I") (re.++ (str.to_re "s") (re.++ (str.to_re "M") (re.++ (str.to_re "a") (re.++ (str.to_re "t") (re.++ (str.to_re "c") (re.++ (str.to_re "h") (re.++ (re.++ (re.++ (re.++ (str.to_re "c") (re.++ (str.to_re "u") (re.++ (str.to_re "l") (re.++ (str.to_re "t") (re.++ (str.to_re "u") (re.++ (str.to_re "r") (str.to_re "e"))))))) (re.++ (str.to_re ",") (re.++ (str.to_re " ") (re.++ (str.to_re "@") (str.to_re "\u{22}"))))) (re.++ (str.to_re "") (re.++ ((_ re.loop 2 2) (re.range "a" "z")) (re.* (re.++ (str.to_re "-") ((_ re.loop 2 2) (re.range "A" "Z"))))))) (re.++ (str.to_re "") (str.to_re "\u{22}"))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)