;test regex asdasd="([0-9]{1})";APRI="([0-9]{9})";ADD="([0-9]{1})"
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "a") (re.++ (str.to_re "s") (re.++ (str.to_re "d") (re.++ (str.to_re "a") (re.++ (str.to_re "s") (re.++ (str.to_re "d") (re.++ (str.to_re "=") (re.++ (str.to_re "\u{22}") (re.++ ((_ re.loop 1 1) (re.range "0" "9")) (re.++ (str.to_re "\u{22}") (re.++ (str.to_re ";") (re.++ (str.to_re "A") (re.++ (str.to_re "P") (re.++ (str.to_re "R") (re.++ (str.to_re "I") (re.++ (str.to_re "=") (re.++ (str.to_re "\u{22}") (re.++ ((_ re.loop 9 9) (re.range "0" "9")) (re.++ (str.to_re "\u{22}") (re.++ (str.to_re ";") (re.++ (str.to_re "A") (re.++ (str.to_re "D") (re.++ (str.to_re "D") (re.++ (str.to_re "=") (re.++ (str.to_re "\u{22}") (re.++ ((_ re.loop 1 1) (re.range "0" "9")) (str.to_re "\u{22}")))))))))))))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)