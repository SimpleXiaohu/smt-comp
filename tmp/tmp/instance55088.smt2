;test regex grep("([:alnum:]{6})c([:digit:]{2}).png", Face)
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "g") (re.++ (str.to_re "r") (re.++ (str.to_re "e") (re.++ (str.to_re "p") (re.++ (re.++ (str.to_re "\u{22}") (re.++ ((_ re.loop 6 6) (re.union (str.to_re ":") (re.union (str.to_re "a") (re.union (str.to_re "l") (re.union (str.to_re "n") (re.union (str.to_re "u") (re.union (str.to_re "m") (str.to_re ":")))))))) (re.++ (str.to_re "c") (re.++ ((_ re.loop 2 2) (re.union (str.to_re ":") (re.union (str.to_re "d") (re.union (str.to_re "i") (re.union (str.to_re "g") (re.union (str.to_re "i") (re.union (str.to_re "t") (str.to_re ":")))))))) (re.++ (re.diff re.allchar (str.to_re "\n")) (re.++ (str.to_re "p") (re.++ (str.to_re "n") (re.++ (str.to_re "g") (str.to_re "\u{22}"))))))))) (re.++ (str.to_re ",") (re.++ (str.to_re " ") (re.++ (str.to_re "F") (re.++ (str.to_re "a") (re.++ (str.to_re "c") (str.to_re "e")))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)