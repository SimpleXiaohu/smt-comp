;test regex (?:[&\d\w ]){0,16}?(\w{3,16})(?:[&\d\w ]){0,16}
(declare-const X String)
(assert (str.in_re X (re.++ ((_ re.loop 0 16) (re.union (str.to_re "&") (re.union (re.range "0" "9") (re.union (re.union (re.range "a" "z") (re.union (re.range "A" "Z") (re.union (re.range "0" "9") (str.to_re "_")))) (str.to_re " "))))) (re.++ ((_ re.loop 3 16) (re.union (re.range "a" "z") (re.union (re.range "A" "Z") (re.union (re.range "0" "9") (str.to_re "_"))))) ((_ re.loop 0 16) (re.union (str.to_re "&") (re.union (re.range "0" "9") (re.union (re.union (re.range "a" "z") (re.union (re.range "A" "Z") (re.union (re.range "0" "9") (str.to_re "_")))) (str.to_re " ")))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)