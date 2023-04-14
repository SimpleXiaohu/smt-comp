;test regex ^([0-9]{1,2}:[0-9]{2}:[0-9]{2}) --> ([0-9]{1,2}:[0-9]{2}:[0-9]{2})$
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (str.to_re "") (re.++ (re.++ ((_ re.loop 1 2) (re.range "0" "9")) (re.++ (str.to_re ":") (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (re.++ (str.to_re ":") ((_ re.loop 2 2) (re.range "0" "9")))))) (re.++ (str.to_re " ") (re.++ (str.to_re "-") (re.++ (str.to_re "-") (re.++ (str.to_re ">") (re.++ (str.to_re " ") (re.++ ((_ re.loop 1 2) (re.range "0" "9")) (re.++ (str.to_re ":") (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (re.++ (str.to_re ":") ((_ re.loop 2 2) (re.range "0" "9"))))))))))))) (str.to_re ""))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)