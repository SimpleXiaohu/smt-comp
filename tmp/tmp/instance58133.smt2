;test regex =REGEXREPLACE(A1,"[\?\*]{2,}","*")
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "=") (re.++ (str.to_re "R") (re.++ (str.to_re "E") (re.++ (str.to_re "G") (re.++ (str.to_re "E") (re.++ (str.to_re "X") (re.++ (str.to_re "R") (re.++ (str.to_re "E") (re.++ (str.to_re "P") (re.++ (str.to_re "L") (re.++ (str.to_re "A") (re.++ (str.to_re "C") (re.++ (str.to_re "E") (re.++ (re.++ (re.++ (str.to_re "A") (str.to_re "1")) (re.++ (str.to_re ",") (re.++ (str.to_re "\u{22}") (re.++ (re.++ (re.* (re.union (str.to_re "?") (str.to_re "*"))) ((_ re.loop 2 2) (re.union (str.to_re "?") (str.to_re "*")))) (str.to_re "\u{22}"))))) (re.++ (str.to_re ",") (re.++ (re.* (str.to_re "\u{22}")) (str.to_re "\u{22}")))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)