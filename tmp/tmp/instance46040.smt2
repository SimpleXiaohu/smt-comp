;test regex std::regex rgx("\/\/(\\w+?){1,1}\/(\\w+?)\/([\\w\/]+)\/([\\w]+)\\.(.+)$");
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "s") (re.++ (str.to_re "t") (re.++ (str.to_re "d") (re.++ (str.to_re ":") (re.++ (str.to_re ":") (re.++ (str.to_re "r") (re.++ (str.to_re "e") (re.++ (str.to_re "g") (re.++ (str.to_re "e") (re.++ (str.to_re "x") (re.++ (str.to_re " ") (re.++ (str.to_re "r") (re.++ (str.to_re "g") (re.++ (str.to_re "x") (re.++ (re.++ (re.++ (str.to_re "\u{22}") (re.++ (str.to_re "/") (re.++ (str.to_re "/") (re.++ ((_ re.loop 1 1) (re.++ (str.to_re "\\") (re.+ (str.to_re "w")))) (re.++ (str.to_re "/") (re.++ (re.++ (str.to_re "\\") (re.+ (str.to_re "w"))) (re.++ (str.to_re "/") (re.++ (re.+ (re.union (str.to_re "\\") (re.union (str.to_re "w") (str.to_re "/")))) (re.++ (str.to_re "/") (re.++ (re.+ (re.union (str.to_re "\\") (str.to_re "w"))) (re.++ (str.to_re "\\") (re.++ (re.diff re.allchar (str.to_re "\n")) (re.+ (re.diff re.allchar (str.to_re "\n"))))))))))))))) (re.++ (str.to_re "") (str.to_re "\u{22}"))) (str.to_re ";"))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)