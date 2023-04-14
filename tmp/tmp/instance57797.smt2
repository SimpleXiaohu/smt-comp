;test regex egrep '^(([^A-Z]*([A-Z][^A-Z]*){2})|([^0-9]*([0-9][^0-9]*){2}))$' test.txt
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (re.++ (str.to_re "e") (re.++ (str.to_re "g") (re.++ (str.to_re "r") (re.++ (str.to_re "e") (re.++ (str.to_re "p") (re.++ (str.to_re " ") (str.to_re "\u{27}"))))))) (re.++ (str.to_re "") (re.union (re.++ (re.* (re.diff re.allchar (re.range "A" "Z"))) ((_ re.loop 2 2) (re.++ (re.range "A" "Z") (re.* (re.diff re.allchar (re.range "A" "Z")))))) (re.++ (re.* (re.diff re.allchar (re.range "0" "9"))) ((_ re.loop 2 2) (re.++ (re.range "0" "9") (re.* (re.diff re.allchar (re.range "0" "9"))))))))) (re.++ (str.to_re "") (re.++ (str.to_re "\u{27}") (re.++ (str.to_re " ") (re.++ (str.to_re "t") (re.++ (str.to_re "e") (re.++ (str.to_re "s") (re.++ (str.to_re "t") (re.++ (re.diff re.allchar (str.to_re "\n")) (re.++ (str.to_re "t") (re.++ (str.to_re "x") (str.to_re "t"))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)