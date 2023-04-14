;test regex \v(\/\/[^\n]*|\/\*(\_[^*]|\*\_[^/])*)@<!<[A-Z_]{2,}>
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "\u{0B}") (re.++ (re.union (re.++ (str.to_re "/") (re.++ (str.to_re "/") (re.* (re.diff re.allchar (str.to_re "\u{0a}"))))) (re.++ (str.to_re "/") (re.++ (str.to_re "*") (re.* (re.union (re.++ (str.to_re "_") (re.diff re.allchar (str.to_re "*"))) (re.++ (str.to_re "*") (re.++ (str.to_re "_") (re.diff re.allchar (str.to_re "/"))))))))) (re.++ (str.to_re "@") (re.++ (str.to_re "<") (re.++ (str.to_re "!") (re.++ (str.to_re "<") (re.++ (re.++ (re.* (re.union (re.range "A" "Z") (str.to_re "_"))) ((_ re.loop 2 2) (re.union (re.range "A" "Z") (str.to_re "_")))) (str.to_re ">"))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)