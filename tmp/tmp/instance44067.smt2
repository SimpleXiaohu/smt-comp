;test regex /\v.*\zs<[A-Z]{2,}
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "/") (re.++ (str.to_re "\u{0B}") (re.++ (re.* (re.diff re.allchar (str.to_re "\n"))) (re.++ (str.to_re "z") (re.++ (str.to_re "s") (re.++ (str.to_re "<") (re.++ (re.* (re.range "A" "Z")) ((_ re.loop 2 2) (re.range "A" "Z")))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)