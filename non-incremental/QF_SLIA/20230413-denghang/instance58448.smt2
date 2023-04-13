
(set-info :smt-lib-version 2.6)
(set-logic QF_SLIA)
(set-info :source |
Generated by: Denghang Hu,
Generated on: 20230413,
Application: Evaluate string solvers
Description: The instance consists of:
(1) a regular membership predicate from the real world
(2) a regular membership predicate to sanitize danger letters in javascript such as <,>,&,",'
(3) a lower bound for string length
Target solver: Ostrich, Z3str3, CVC5
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
        ;test regex ^(?:\d{1,16}|(?:[\n\r -Z_]|\xC2\xA0|\xCE\xA9){1,11})$
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (str.to_re "") (re.union ((_ re.loop 1 16) (re.range "0" "9")) ((_ re.loop 1 11) (re.union (re.union (re.union (str.to_re "\u{0a}") (re.union (str.to_re "\u{0d}") (re.union (re.range " " "Z") (str.to_re "_")))) (re.++ (str.to_re "\u{c2}") (str.to_re "\u{a0}"))) (re.++ (str.to_re "\u{ce}") (str.to_re "\u{a9}")))))) (str.to_re ""))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)(exit)