;test regex "(\\b\\w*?)(\\w)\\2{2,}(\\w*)"
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "\u{22}") (re.++ (re.++ (str.to_re "\\") (re.++ (str.to_re "b") (re.++ (str.to_re "\\") (re.* (str.to_re "w"))))) (re.++ (re.++ (str.to_re "\\") (str.to_re "w")) (re.++ (str.to_re "\\") (re.++ (re.++ (re.* (str.to_re "2")) ((_ re.loop 2 2) (str.to_re "2"))) (re.++ (re.++ (str.to_re "\\") (re.* (str.to_re "w"))) (str.to_re "\u{22}")))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)