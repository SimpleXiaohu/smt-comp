;test regex blkid $1 | grep -o -E "[a-f0-9-]{8}([a-f0-9-]{4}){3}[a-f0-9-]{12}"
(declare-const X String)
(assert (str.in_re X (re.union (re.++ (re.++ (str.to_re "b") (re.++ (str.to_re "l") (re.++ (str.to_re "k") (re.++ (str.to_re "i") (re.++ (str.to_re "d") (str.to_re " ")))))) (re.++ (str.to_re "") (re.++ (str.to_re "1") (str.to_re " ")))) (re.++ (str.to_re " ") (re.++ (str.to_re "g") (re.++ (str.to_re "r") (re.++ (str.to_re "e") (re.++ (str.to_re "p") (re.++ (str.to_re " ") (re.++ (str.to_re "-") (re.++ (str.to_re "o") (re.++ (str.to_re " ") (re.++ (str.to_re "-") (re.++ (str.to_re "E") (re.++ (str.to_re " ") (re.++ (str.to_re "\u{22}") (re.++ ((_ re.loop 8 8) (re.union (re.range "a" "f") (re.union (re.range "0" "9") (str.to_re "-")))) (re.++ ((_ re.loop 3 3) ((_ re.loop 4 4) (re.union (re.range "a" "f") (re.union (re.range "0" "9") (str.to_re "-"))))) (re.++ ((_ re.loop 12 12) (re.union (re.range "a" "f") (re.union (re.range "0" "9") (str.to_re "-")))) (str.to_re "\u{22}"))))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)