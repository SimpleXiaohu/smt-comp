;test regex sed -i "s/:[0-9]{4,5}/:$OTHERNUMBER/" $FILENAME
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (re.++ (str.to_re "s") (re.++ (str.to_re "e") (re.++ (str.to_re "d") (re.++ (str.to_re " ") (re.++ (str.to_re "-") (re.++ (str.to_re "i") (re.++ (str.to_re " ") (re.++ (str.to_re "\u{22}") (re.++ (str.to_re "s") (re.++ (str.to_re "/") (re.++ (str.to_re ":") (re.++ ((_ re.loop 4 5) (re.range "0" "9")) (re.++ (str.to_re "/") (str.to_re ":")))))))))))))) (re.++ (str.to_re "") (re.++ (str.to_re "O") (re.++ (str.to_re "T") (re.++ (str.to_re "H") (re.++ (str.to_re "E") (re.++ (str.to_re "R") (re.++ (str.to_re "N") (re.++ (str.to_re "U") (re.++ (str.to_re "M") (re.++ (str.to_re "B") (re.++ (str.to_re "E") (re.++ (str.to_re "R") (re.++ (str.to_re "/") (re.++ (str.to_re "\u{22}") (str.to_re " ")))))))))))))))) (re.++ (str.to_re "") (re.++ (str.to_re "F") (re.++ (str.to_re "I") (re.++ (str.to_re "L") (re.++ (str.to_re "E") (re.++ (str.to_re "N") (re.++ (str.to_re "A") (re.++ (str.to_re "M") (str.to_re "E"))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)