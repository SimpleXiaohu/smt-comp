;test regex Find what: (^\D+)(\d{1,5})(\D)
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "F") (re.++ (str.to_re "i") (re.++ (str.to_re "n") (re.++ (str.to_re "d") (re.++ (str.to_re " ") (re.++ (str.to_re "w") (re.++ (str.to_re "h") (re.++ (str.to_re "a") (re.++ (str.to_re "t") (re.++ (str.to_re ":") (re.++ (str.to_re " ") (re.++ (re.++ (str.to_re "") (re.+ (re.diff re.allchar (re.range "0" "9")))) (re.++ ((_ re.loop 1 5) (re.range "0" "9")) (re.diff re.allchar (re.range "0" "9")))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)