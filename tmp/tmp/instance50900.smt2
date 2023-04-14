;test regex \w{3}_\d{5}  ===> [a-zA-Z0-9_]{3}_[0-9]{5}
(declare-const X String)
(assert (str.in_re X (re.++ ((_ re.loop 3 3) (re.union (re.range "a" "z") (re.union (re.range "A" "Z") (re.union (re.range "0" "9") (str.to_re "_"))))) (re.++ (str.to_re "_") (re.++ ((_ re.loop 5 5) (re.range "0" "9")) (re.++ (str.to_re " ") (re.++ (str.to_re " ") (re.++ (str.to_re "=") (re.++ (str.to_re "=") (re.++ (str.to_re "=") (re.++ (str.to_re ">") (re.++ (str.to_re " ") (re.++ ((_ re.loop 3 3) (re.union (re.range "a" "z") (re.union (re.range "A" "Z") (re.union (re.range "0" "9") (str.to_re "_"))))) (re.++ (str.to_re "_") ((_ re.loop 5 5) (re.range "0" "9"))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)