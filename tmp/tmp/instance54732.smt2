;test regex String twoPlusUCRegEx = "([A-Z][a-z]*){2,}";
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "S") (re.++ (str.to_re "t") (re.++ (str.to_re "r") (re.++ (str.to_re "i") (re.++ (str.to_re "n") (re.++ (str.to_re "g") (re.++ (str.to_re " ") (re.++ (str.to_re "t") (re.++ (str.to_re "w") (re.++ (str.to_re "o") (re.++ (str.to_re "P") (re.++ (str.to_re "l") (re.++ (str.to_re "u") (re.++ (str.to_re "s") (re.++ (str.to_re "U") (re.++ (str.to_re "C") (re.++ (str.to_re "R") (re.++ (str.to_re "e") (re.++ (str.to_re "g") (re.++ (str.to_re "E") (re.++ (str.to_re "x") (re.++ (str.to_re " ") (re.++ (str.to_re "=") (re.++ (str.to_re " ") (re.++ (str.to_re "\u{22}") (re.++ (re.++ (re.* (re.++ (re.range "A" "Z") (re.* (re.range "a" "z")))) ((_ re.loop 2 2) (re.++ (re.range "A" "Z") (re.* (re.range "a" "z"))))) (re.++ (str.to_re "\u{22}") (str.to_re ";"))))))))))))))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)