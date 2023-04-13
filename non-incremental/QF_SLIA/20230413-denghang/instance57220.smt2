
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
        ;test regex /<span[^>]*class=\"link[^>]*params=\"(\d+),(\d+),[^>]*>[^<]*from.*?(\d{1,2})(.*?)(\d{4}).*?(year|Year)[^<]*<\/span>/
(declare-const X String)
(assert (str.in_re X (re.++ (re.++ (re.++ (str.to_re "/") (re.++ (str.to_re "<") (re.++ (str.to_re "s") (re.++ (str.to_re "p") (re.++ (str.to_re "a") (re.++ (str.to_re "n") (re.++ (re.* (re.diff re.allchar (str.to_re ">"))) (re.++ (str.to_re "c") (re.++ (str.to_re "l") (re.++ (str.to_re "a") (re.++ (str.to_re "s") (re.++ (str.to_re "s") (re.++ (str.to_re "=") (re.++ (str.to_re "\u{22}") (re.++ (str.to_re "l") (re.++ (str.to_re "i") (re.++ (str.to_re "n") (re.++ (str.to_re "k") (re.++ (re.* (re.diff re.allchar (str.to_re ">"))) (re.++ (str.to_re "p") (re.++ (str.to_re "a") (re.++ (str.to_re "r") (re.++ (str.to_re "a") (re.++ (str.to_re "m") (re.++ (str.to_re "s") (re.++ (str.to_re "=") (re.++ (str.to_re "\u{22}") (re.+ (re.range "0" "9"))))))))))))))))))))))))))))) (re.++ (str.to_re ",") (re.+ (re.range "0" "9")))) (re.++ (str.to_re ",") (re.++ (re.* (re.diff re.allchar (str.to_re ">"))) (re.++ (str.to_re ">") (re.++ (re.* (re.diff re.allchar (str.to_re "<"))) (re.++ (str.to_re "f") (re.++ (str.to_re "r") (re.++ (str.to_re "o") (re.++ (str.to_re "m") (re.++ (re.* (re.diff re.allchar (str.to_re "\n"))) (re.++ ((_ re.loop 1 2) (re.range "0" "9")) (re.++ (re.* (re.diff re.allchar (str.to_re "\n"))) (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.++ (re.* (re.diff re.allchar (str.to_re "\n"))) (re.++ (re.union (re.++ (str.to_re "y") (re.++ (str.to_re "e") (re.++ (str.to_re "a") (str.to_re "r")))) (re.++ (str.to_re "Y") (re.++ (str.to_re "e") (re.++ (str.to_re "a") (str.to_re "r"))))) (re.++ (re.* (re.diff re.allchar (str.to_re "<"))) (re.++ (str.to_re "<") (re.++ (str.to_re "/") (re.++ (str.to_re "s") (re.++ (str.to_re "p") (re.++ (str.to_re "a") (re.++ (str.to_re "n") (re.++ (str.to_re ">") (str.to_re "/"))))))))))))))))))))))))))
; sanitize danger characters:  < > ' " &
(assert (not (str.in_re X (re.++ re.all (re.union (str.to_re "\u{3c}") (str.to_re "\u{3e}") (str.to_re "\u{27}") (str.to_re "\u{22}") (str.to_re "\u{26}")) re.all))))
(assert (< 20 (str.len X)))
(check-sat)
(get-model)(exit)