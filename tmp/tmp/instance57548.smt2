;test regex s/(.*)<\?php.*?search_term.*?\?>/${1}HELLO/ims;
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (str.to_re "s") (re.++ (str.to_re "/") (re.++ (re.* (re.diff re.allchar (str.to_re "\n"))) (re.++ (str.to_re "<") (re.++ (str.to_re "?") (re.++ (str.to_re "p") (re.++ (str.to_re "h") (re.++ (str.to_re "p") (re.++ (re.* (re.diff re.allchar (str.to_re "\n"))) (re.++ (str.to_re "s") (re.++ (str.to_re "e") (re.++ (str.to_re "a") (re.++ (str.to_re "r") (re.++ (str.to_re "c") (re.++ (str.to_re "h") (re.++ (str.to_re "_") (re.++ (str.to_re "t") (re.++ (str.to_re "e") (re.++ (str.to_re "r") (re.++ (str.to_re "m") (re.++ (re.* (re.diff re.allchar (str.to_re "\n"))) (re.++ (str.to_re "?") (re.++ (str.to_re ">") (str.to_re "/")))))))))))))))))))))))) (re.++ ((_ re.loop 1 1) (str.to_re "")) (re.++ (str.to_re "H") (re.++ (str.to_re "E") (re.++ (str.to_re "L") (re.++ (str.to_re "L") (re.++ (str.to_re "O") (re.++ (str.to_re "/") (re.++ (str.to_re "i") (re.++ (str.to_re "m") (re.++ (str.to_re "s") (str.to_re ";"))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)