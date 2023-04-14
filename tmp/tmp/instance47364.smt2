;test regex std::regex rx("[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}([^\\\\]*)")
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "s") (re.++ (str.to_re "t") (re.++ (str.to_re "d") (re.++ (str.to_re ":") (re.++ (str.to_re ":") (re.++ (str.to_re "r") (re.++ (str.to_re "e") (re.++ (str.to_re "g") (re.++ (str.to_re "e") (re.++ (str.to_re "x") (re.++ (str.to_re " ") (re.++ (str.to_re "r") (re.++ (str.to_re "x") (re.++ (str.to_re "\u{22}") (re.++ ((_ re.loop 8 8) (re.union (re.range "0" "9") (re.union (re.range "A" "F") (re.range "a" "f")))) (re.++ ((_ re.loop 3 3) (re.++ (str.to_re "-") ((_ re.loop 4 4) (re.union (re.range "0" "9") (re.union (re.range "A" "F") (re.range "a" "f")))))) (re.++ (str.to_re "-") (re.++ ((_ re.loop 12 12) (re.union (re.range "0" "9") (re.union (re.range "A" "F") (re.range "a" "f")))) (re.++ (re.* (re.inter (re.diff re.allchar (str.to_re "\\")) (re.diff re.allchar (str.to_re "\\")))) (str.to_re "\u{22}"))))))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)