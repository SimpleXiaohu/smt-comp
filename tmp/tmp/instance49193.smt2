;test regex perl -0777 -pi -e 's#\Q$ARGV\E$/{2}##' *.txt
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (re.++ (str.to_re "p") (re.++ (str.to_re "e") (re.++ (str.to_re "r") (re.++ (str.to_re "l") (re.++ (str.to_re " ") (re.++ (str.to_re "-") (re.++ (str.to_re "0777") (re.++ (str.to_re " ") (re.++ (str.to_re "-") (re.++ (str.to_re "p") (re.++ (str.to_re "i") (re.++ (str.to_re " ") (re.++ (str.to_re "-") (re.++ (str.to_re "e") (re.++ (str.to_re " ") (re.++ (str.to_re "\u{27}") (re.++ (str.to_re "s") (re.++ (str.to_re "#") (str.to_re "Q"))))))))))))))))))) (re.++ (str.to_re "") (re.++ (str.to_re "A") (re.++ (str.to_re "R") (re.++ (str.to_re "G") (re.++ (str.to_re "V") (str.to_re "E"))))))) (re.++ (str.to_re "") (re.++ ((_ re.loop 2 2) (str.to_re "/")) (re.++ (str.to_re "#") (re.++ (str.to_re "#") (re.++ (str.to_re "\u{27}") (re.++ (re.* (str.to_re " ")) (re.++ (re.diff re.allchar (str.to_re "\n")) (re.++ (str.to_re "t") (re.++ (str.to_re "x") (str.to_re "t")))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)