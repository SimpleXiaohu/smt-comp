;test regex String pattern = "Abcdef_ghi_*_(\\d{8})_(\\d{4})_\\w+";
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "S") (re.++ (str.to_re "t") (re.++ (str.to_re "r") (re.++ (str.to_re "i") (re.++ (str.to_re "n") (re.++ (str.to_re "g") (re.++ (str.to_re " ") (re.++ (str.to_re "p") (re.++ (str.to_re "a") (re.++ (str.to_re "t") (re.++ (str.to_re "t") (re.++ (str.to_re "e") (re.++ (str.to_re "r") (re.++ (str.to_re "n") (re.++ (str.to_re " ") (re.++ (str.to_re "=") (re.++ (str.to_re " ") (re.++ (str.to_re "\u{22}") (re.++ (str.to_re "A") (re.++ (str.to_re "b") (re.++ (str.to_re "c") (re.++ (str.to_re "d") (re.++ (str.to_re "e") (re.++ (str.to_re "f") (re.++ (str.to_re "_") (re.++ (str.to_re "g") (re.++ (str.to_re "h") (re.++ (str.to_re "i") (re.++ (re.* (str.to_re "_")) (re.++ (str.to_re "_") (re.++ (re.++ (str.to_re "\\") ((_ re.loop 8 8) (str.to_re "d"))) (re.++ (str.to_re "_") (re.++ (re.++ (str.to_re "\\") ((_ re.loop 4 4) (str.to_re "d"))) (re.++ (str.to_re "_") (re.++ (str.to_re "\\") (re.++ (re.+ (str.to_re "w")) (re.++ (str.to_re "\u{22}") (str.to_re ";"))))))))))))))))))))))))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)