;test regex str.replaceAll("(\\r\\n?|\\n){3,}", "$1$1");
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "s") (re.++ (str.to_re "t") (re.++ (str.to_re "r") (re.++ (re.diff re.allchar (str.to_re "\n")) (re.++ (str.to_re "r") (re.++ (str.to_re "e") (re.++ (str.to_re "p") (re.++ (str.to_re "l") (re.++ (str.to_re "a") (re.++ (str.to_re "c") (re.++ (str.to_re "e") (re.++ (str.to_re "A") (re.++ (str.to_re "l") (re.++ (str.to_re "l") (re.++ (re.++ (re.++ (re.++ (re.++ (str.to_re "\u{22}") (re.++ (re.++ (re.* (re.union (re.++ (str.to_re "\\") (re.++ (str.to_re "r") (re.++ (str.to_re "\\") (re.opt (str.to_re "n"))))) (re.++ (str.to_re "\\") (str.to_re "n")))) ((_ re.loop 3 3) (re.union (re.++ (str.to_re "\\") (re.++ (str.to_re "r") (re.++ (str.to_re "\\") (re.opt (str.to_re "n"))))) (re.++ (str.to_re "\\") (str.to_re "n"))))) (str.to_re "\u{22}"))) (re.++ (str.to_re ",") (re.++ (str.to_re " ") (str.to_re "\u{22}")))) (re.++ (str.to_re "") (str.to_re "1"))) (re.++ (str.to_re "") (re.++ (str.to_re "1") (str.to_re "\u{22}")))) (str.to_re ";"))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)