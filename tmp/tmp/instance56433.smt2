;test regex SELECT 'Nov. 12th, 60' REGEXP '(^|[^0-9])[0-9]{2}$';
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (re.++ (str.to_re "S") (re.++ (str.to_re "E") (re.++ (str.to_re "L") (re.++ (str.to_re "E") (re.++ (str.to_re "C") (re.++ (str.to_re "T") (re.++ (str.to_re " ") (re.++ (str.to_re "\u{27}") (re.++ (str.to_re "N") (re.++ (str.to_re "o") (re.++ (str.to_re "v") (re.++ (re.diff re.allchar (str.to_re "\n")) (re.++ (str.to_re " ") (re.++ (str.to_re "12") (re.++ (str.to_re "t") (str.to_re "h")))))))))))))))) (re.++ (str.to_re ",") (re.++ (str.to_re " ") (re.++ (str.to_re "60") (re.++ (str.to_re "\u{27}") (re.++ (str.to_re " ") (re.++ (str.to_re "R") (re.++ (str.to_re "E") (re.++ (str.to_re "G") (re.++ (str.to_re "E") (re.++ (str.to_re "X") (re.++ (str.to_re "P") (re.++ (str.to_re " ") (re.++ (str.to_re "\u{27}") (re.++ (re.union (str.to_re "") (re.diff re.allchar (re.range "0" "9"))) ((_ re.loop 2 2) (re.range "0" "9"))))))))))))))))) (re.++ (str.to_re "") (re.++ (str.to_re "\u{27}") (str.to_re ";"))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)