;test regex ... regexp concat('[0-9]{1,5} ',T2.Name)...
(declare-const X String)
(assert (str.in_re X (re.++ (re.diff re.allchar (str.to_re "\n")) (re.++ (re.diff re.allchar (str.to_re "\n")) (re.++ (re.diff re.allchar (str.to_re "\n")) (re.++ (str.to_re " ") (re.++ (str.to_re "r") (re.++ (str.to_re "e") (re.++ (str.to_re "g") (re.++ (str.to_re "e") (re.++ (str.to_re "x") (re.++ (str.to_re "p") (re.++ (str.to_re " ") (re.++ (str.to_re "c") (re.++ (str.to_re "o") (re.++ (str.to_re "n") (re.++ (str.to_re "c") (re.++ (str.to_re "a") (re.++ (str.to_re "t") (re.++ (re.++ (re.++ (str.to_re "\u{27}") (re.++ ((_ re.loop 1 5) (re.range "0" "9")) (re.++ (str.to_re " ") (str.to_re "\u{27}")))) (re.++ (str.to_re ",") (re.++ (str.to_re "T") (re.++ (str.to_re "2") (re.++ (re.diff re.allchar (str.to_re "\n")) (re.++ (str.to_re "N") (re.++ (str.to_re "a") (re.++ (str.to_re "m") (str.to_re "e"))))))))) (re.++ (re.diff re.allchar (str.to_re "\n")) (re.++ (re.diff re.allchar (str.to_re "\n")) (re.diff re.allchar (str.to_re "\n"))))))))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)