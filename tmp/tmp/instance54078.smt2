;test regex str_extract(z, "\\s{2,}[a-z]*\\s{2,}")
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "s") (re.++ (str.to_re "t") (re.++ (str.to_re "r") (re.++ (str.to_re "_") (re.++ (str.to_re "e") (re.++ (str.to_re "x") (re.++ (str.to_re "t") (re.++ (str.to_re "r") (re.++ (str.to_re "a") (re.++ (str.to_re "c") (re.++ (str.to_re "t") (re.++ (str.to_re "z") (re.++ (str.to_re ",") (re.++ (str.to_re " ") (re.++ (str.to_re "\u{22}") (re.++ (str.to_re "\\") (re.++ (re.++ (re.* (str.to_re "s")) ((_ re.loop 2 2) (str.to_re "s"))) (re.++ (re.* (re.range "a" "z")) (re.++ (str.to_re "\\") (re.++ (re.++ (re.* (str.to_re "s")) ((_ re.loop 2 2) (str.to_re "s"))) (str.to_re "\u{22}")))))))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)