;test regex my $is_valid = $id =~ m/[0-9]{11}/ && $id =~ /[1-9]/;
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (re.++ (re.++ (str.to_re "m") (re.++ (str.to_re "y") (str.to_re " "))) (re.++ (str.to_re "") (re.++ (str.to_re "i") (re.++ (str.to_re "s") (re.++ (str.to_re "_") (re.++ (str.to_re "v") (re.++ (str.to_re "a") (re.++ (str.to_re "l") (re.++ (str.to_re "i") (re.++ (str.to_re "d") (re.++ (str.to_re " ") (re.++ (str.to_re "=") (str.to_re " "))))))))))))) (re.++ (str.to_re "") (re.++ (str.to_re "i") (re.++ (str.to_re "d") (re.++ (str.to_re " ") (re.++ (str.to_re "=") (re.++ (str.to_re "~") (re.++ (str.to_re " ") (re.++ (str.to_re "m") (re.++ (str.to_re "/") (re.++ ((_ re.loop 11 11) (re.range "0" "9")) (re.++ (str.to_re "/") (re.++ (str.to_re " ") (re.++ (str.to_re "&") (re.++ (str.to_re "&") (str.to_re " ")))))))))))))))) (re.++ (str.to_re "") (re.++ (str.to_re "i") (re.++ (str.to_re "d") (re.++ (str.to_re " ") (re.++ (str.to_re "=") (re.++ (str.to_re "~") (re.++ (str.to_re " ") (re.++ (str.to_re "/") (re.++ (re.range "1" "9") (re.++ (str.to_re "/") (str.to_re ";"))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)