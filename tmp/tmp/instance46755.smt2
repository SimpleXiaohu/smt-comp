;test regex var pattern = "^([0-9]{0,2}?.?[0-9]{0,2}|1[0-9].?[0-9]{0,2}|2[0-4].?[0-9]{0,2})$";
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (re.++ (str.to_re "v") (re.++ (str.to_re "a") (re.++ (str.to_re "r") (re.++ (str.to_re " ") (re.++ (str.to_re "p") (re.++ (str.to_re "a") (re.++ (str.to_re "t") (re.++ (str.to_re "t") (re.++ (str.to_re "e") (re.++ (str.to_re "r") (re.++ (str.to_re "n") (re.++ (str.to_re " ") (re.++ (str.to_re "=") (re.++ (str.to_re " ") (str.to_re "\u{22}"))))))))))))))) (re.++ (str.to_re "") (re.union (re.union (re.++ ((_ re.loop 0 2) (re.range "0" "9")) (re.++ (re.opt (re.diff re.allchar (str.to_re "\n"))) ((_ re.loop 0 2) (re.range "0" "9")))) (re.++ (str.to_re "1") (re.++ (re.range "0" "9") (re.++ (re.opt (re.diff re.allchar (str.to_re "\n"))) ((_ re.loop 0 2) (re.range "0" "9")))))) (re.++ (str.to_re "2") (re.++ (re.range "0" "4") (re.++ (re.opt (re.diff re.allchar (str.to_re "\n"))) ((_ re.loop 0 2) (re.range "0" "9")))))))) (re.++ (str.to_re "") (re.++ (str.to_re "\u{22}") (str.to_re ";"))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)