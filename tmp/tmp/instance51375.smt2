;test regex '~\R{2}\h{5,}~'
(declare-const X String)
(assert (str.in_re X (re.++ (str.to_re "\u{27}") (re.++ (str.to_re "~") (re.++ ((_ re.loop 2 2) (str.to_re "R")) (re.++ (re.++ (re.* (str.to_re "h")) ((_ re.loop 5 5) (str.to_re "h"))) (re.++ (str.to_re "~") (str.to_re "\u{27}"))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)