;test regex REGEXP_EXTRACT(column_name,'[(?:(^_A-Z))](\d{7})',0)
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "R") (re.++ (str.to_re "E") (re.++ (str.to_re "G") (re.++ (str.to_re "E") (re.++ (str.to_re "X") (re.++ (str.to_re "P") (re.++ (str.to_re "_") (re.++ (str.to_re "E") (re.++ (str.to_re "X") (re.++ (str.to_re "T") (re.++ (str.to_re "R") (re.++ (str.to_re "A") (re.++ (str.to_re "C") (re.++ (str.to_re "T") (re.++ (re.++ (re.++ (str.to_re "c") (re.++ (str.to_re "o") (re.++ (str.to_re "l") (re.++ (str.to_re "u") (re.++ (str.to_re "m") (re.++ (str.to_re "n") (re.++ (str.to_re "_") (re.++ (str.to_re "n") (re.++ (str.to_re "a") (re.++ (str.to_re "m") (str.to_re "e"))))))))))) (re.++ (str.to_re ",") (re.++ (str.to_re "\u{27}") (re.++ (re.union (str.to_re "(") (re.union (str.to_re "?") (re.union (str.to_re ":") (re.union (str.to_re "(") (re.union (str.to_re "^") (re.union (str.to_re "_") (re.union (re.range "A" "Z") (re.union (str.to_re ")") (str.to_re ")"))))))))) (re.++ ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{27}")))))) (re.++ (str.to_re ",") (str.to_re "0")))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)