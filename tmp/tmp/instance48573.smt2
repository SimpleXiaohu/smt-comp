;test regex ZIP NOT LIKE '[\d]{5}' AND ZIP NOT LIKE '[\d]{9}'
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "Z") (re.++ (str.to_re "I") (re.++ (str.to_re "P") (re.++ (str.to_re " ") (re.++ (str.to_re "N") (re.++ (str.to_re "O") (re.++ (str.to_re "T") (re.++ (str.to_re " ") (re.++ (str.to_re "L") (re.++ (str.to_re "I") (re.++ (str.to_re "K") (re.++ (str.to_re "E") (re.++ (str.to_re " ") (re.++ (str.to_re "\u{27}") (re.++ ((_ re.loop 5 5) (re.range "0" "9")) (re.++ (str.to_re "\u{27}") (re.++ (str.to_re " ") (re.++ (str.to_re "A") (re.++ (str.to_re "N") (re.++ (str.to_re "D") (re.++ (str.to_re " ") (re.++ (str.to_re "Z") (re.++ (str.to_re "I") (re.++ (str.to_re "P") (re.++ (str.to_re " ") (re.++ (str.to_re "N") (re.++ (str.to_re "O") (re.++ (str.to_re "T") (re.++ (str.to_re " ") (re.++ (str.to_re "L") (re.++ (str.to_re "I") (re.++ (str.to_re "K") (re.++ (str.to_re "E") (re.++ (str.to_re " ") (re.++ (str.to_re "\u{27}") (re.++ ((_ re.loop 9 9) (re.range "0" "9")) (str.to_re "\u{27}")))))))))))))))))))))))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)