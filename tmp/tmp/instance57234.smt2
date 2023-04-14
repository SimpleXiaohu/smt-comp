;test regex \\s+([a-zA-Z]){1}\\s+\\d{1,}\\s+\\d{1,}\\s+"
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "\\") (re.++ (re.+ (str.to_re "s")) (re.++ ((_ re.loop 1 1) (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.++ (str.to_re "\\") (re.++ (re.+ (str.to_re "s")) (re.++ (str.to_re "\\") (re.++ (re.++ (re.* (str.to_re "d")) ((_ re.loop 1 1) (str.to_re "d"))) (re.++ (str.to_re "\\") (re.++ (re.+ (str.to_re "s")) (re.++ (str.to_re "\\") (re.++ (re.++ (re.* (str.to_re "d")) ((_ re.loop 1 1) (str.to_re "d"))) (re.++ (str.to_re "\\") (re.++ (re.+ (str.to_re "s")) (str.to_re "\u{22}"))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)