;test regex regex = "^[\\d]{4}-[\\d]{2}-[\\d]{2}.*?[\\d]{4}-[\\d]{2}-[\\d]{2}"
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (str.to_re "r") (re.++ (str.to_re "e") (re.++ (str.to_re "g") (re.++ (str.to_re "e") (re.++ (str.to_re "x") (re.++ (str.to_re " ") (re.++ (str.to_re "=") (re.++ (str.to_re " ") (str.to_re "\u{22}"))))))))) (re.++ (str.to_re "") (re.++ ((_ re.loop 4 4) (re.union (str.to_re "\\") (str.to_re "d"))) (re.++ (str.to_re "-") (re.++ ((_ re.loop 2 2) (re.union (str.to_re "\\") (str.to_re "d"))) (re.++ (str.to_re "-") (re.++ ((_ re.loop 2 2) (re.union (str.to_re "\\") (str.to_re "d"))) (re.++ (re.* (re.diff re.allchar (str.to_re "\n"))) (re.++ ((_ re.loop 4 4) (re.union (str.to_re "\\") (str.to_re "d"))) (re.++ (str.to_re "-") (re.++ ((_ re.loop 2 2) (re.union (str.to_re "\\") (str.to_re "d"))) (re.++ (str.to_re "-") (re.++ ((_ re.loop 2 2) (re.union (str.to_re "\\") (str.to_re "d"))) (str.to_re "\u{22}"))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)