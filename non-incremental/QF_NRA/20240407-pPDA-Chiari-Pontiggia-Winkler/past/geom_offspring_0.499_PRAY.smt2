(set-info :smt-lib-version 2.6)
(set-logic QF_NRA)
(set-info :source |
Generated by: Tobias Winkler
Generated on: 2024-04-07
Generator: PRAY - Probabilistic Recursion Analyzer (https://doi.org/10.5281/zenodo.7506305)
Application: Termination analysis of probabilistic pushdown automata (pPDA)
Target solver: Z3
Publications:
  [1] Tobias Winkler, Joost-Pieter Katoen:
On Certificates, Expected Runtimes, and Termination in Probabilistic Pushdown Automata. LICS 2023: 1-13

This benchmark encodes positive almost sure termination (PAST; termination in finite expected time) of the probabilistic recursive program given below. The program model a process P that spawns a random number of copies of itself; the number of copies is geometrically distributed.
The program was automatically translated to a probabilistic pushdown automaton (pPDA) using the PRAY tool. The SMT formula results from applying Theorem 8 from [1]. The SMT formula is SAT iff the program is PAST.

void P() {
    while flip(499//1000) {
        P();
    }
}

P(); # entry point

|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status sat)

(declare-fun |(4,3,0)| () Real)
(declare-fun |(3,3,0)| () Real)
(declare-fun |(0,3,0)| () Real)
(declare-fun |(0, 0)| () Real)
(declare-fun |(10, 0)| () Real)
(declare-fun |(4, 0)| () Real)
(declare-fun |(3, 0)| () Real)
(declare-fun |(1, 1)| () Real)
(declare-fun |(8, 1)| () Real)
(declare-fun |(6, 1)| () Real)
(declare-fun |(3, 3)| () Real)
(declare-fun |(2, 1)| () Real)
(declare-fun |(10,3,0)| () Real)
(declare-fun |(1,1,9)| () Real)
(declare-fun |(8,1,9)| () Real)
(declare-fun |(6,1,9)| () Real)
(declare-fun |(2,1,9)| () Real)
(declare-fun |(0, 3)| () Real)
(declare-fun |(10, 3)| () Real)
(declare-fun |(4, 3)| () Real)
(declare-fun |(3,0,1)| () Real)
(declare-fun |(5, 2)| () Real)
(declare-fun |(9, 2)| () Real)
(declare-fun |(0,0,1)| () Real)
(declare-fun |(10,0,1)| () Real)
(declare-fun |(4,0,1)| () Real)
(declare-fun |(5,2,7)| () Real)
(declare-fun |(9,2,7)| () Real)
(declare-fun |(7,2,7)| () Real)
(assert (>= |(4,3,0)| 0.0))
(assert (>= |(4,3,0)| (+ 0.0 (* |(0,3,0)| |(3,3,0)| 1.0))))
(assert (>= |(0, 0)| 0.0))
(assert (>= |(0, 0)|
    (+ 0.0 1.0 (* |(4, 0)| (/ 499.0 1000.0)) (* |(10, 0)| (/ 501.0 1000.0)))))
(assert (>= |(3, 0)| 0.0))
(assert (>= |(3, 0)|
    (+ 0.0 1.0 (* |(4, 0)| (/ 499.0 1000.0)) (* |(10, 0)| (/ 501.0 1000.0)))))
(assert (>= |(1, 1)| 0.0))
(assert (>= |(1, 1)|
    (+ 0.0 1.0 (* |(6, 1)| (/ 499.0 1000.0)) (* |(8, 1)| (/ 501.0 1000.0)))))
(assert (>= |(4, 0)| 0.0))
(assert (>= |(4, 0)| (+ 0.0 1.0 (* |(3, 3)| 1.0) (* |(0, 0)| |(3,3,0)| 1.0))))
(assert (>= |(2, 1)| 0.0))
(assert (>= |(2, 1)|
    (+ 0.0 1.0 (* |(6, 1)| (/ 499.0 1000.0)) (* |(8, 1)| (/ 501.0 1000.0)))))
(assert (>= |(10,3,0)| 0.0))
(assert (>= |(10,3,0)| (+ 0.0 1.0)))
(assert (>= |(1,1,9)| 0.0))
(assert (>= |(1,1,9)|
    (+ 0.0 (* |(6,1,9)| (/ 499.0 1000.0)) (* |(8,1,9)| (/ 501.0 1000.0)))))
(assert (>= |(2,1,9)| 0.0))
(assert (>= |(2,1,9)|
    (+ 0.0 (* |(6,1,9)| (/ 499.0 1000.0)) (* |(8,1,9)| (/ 501.0 1000.0)))))
(assert (>= |(0, 3)| 0.0))
(assert (>= |(0, 3)|
    (+ 0.0 1.0 (* |(4, 3)| (/ 499.0 1000.0)) (* |(10, 3)| (/ 501.0 1000.0)))))
(assert (>= |(10, 0)| 0.0))
(assert (>= |(10, 0)| (+ 0.0 1.0)))
(assert (>= |(6,1,9)| 0.0))
(assert (>= |(6,1,9)| (+ 0.0 (* |(1,1,9)| |(3,0,1)| 1.0))))
(assert (>= |(6, 1)| 0.0))
(assert (>= |(6, 1)| (+ 0.0 1.0 (* |(3, 0)| 1.0) (* |(1, 1)| |(3,0,1)| 1.0))))
(assert (>= |(8,1,9)| 0.0))
(assert (>= |(8,1,9)| (+ 0.0 1.0)))
(assert (>= |(8, 1)| 0.0))
(assert (>= |(8, 1)| (+ 0.0 1.0)))
(assert (>= |(5, 2)| 0.0))
(assert (>= |(5, 2)| (+ 0.0 1.0 (* |(2, 1)| 1.0) (* |(9, 2)| |(2,1,9)| 1.0))))
(assert (>= |(3, 3)| 0.0))
(assert (>= |(3, 3)|
    (+ 0.0 1.0 (* |(4, 3)| (/ 499.0 1000.0)) (* |(10, 3)| (/ 501.0 1000.0)))))
(assert (>= |(4, 3)| 0.0))
(assert (>= |(4, 3)| (+ 0.0 1.0 (* |(3, 3)| 1.0) (* |(0, 3)| |(3,3,0)| 1.0))))
(assert (>= |(9, 2)| 0.0))
(assert (>= |(9, 2)| (+ 0.0 1.0)))
(assert (>= |(0,0,1)| 0.0))
(assert (>= |(0,0,1)|
    (+ 0.0 (* |(4,0,1)| (/ 499.0 1000.0)) (* |(10,0,1)| (/ 501.0 1000.0)))))
(assert (>= |(3,0,1)| 0.0))
(assert (>= |(3,0,1)|
    (+ 0.0 (* |(4,0,1)| (/ 499.0 1000.0)) (* |(10,0,1)| (/ 501.0 1000.0)))))
(assert (>= |(4,0,1)| 0.0))
(assert (>= |(4,0,1)| (+ 0.0 (* |(0,0,1)| |(3,3,0)| 1.0))))
(assert (>= |(5,2,7)| 0.0))
(assert (>= |(5,2,7)| (+ 0.0 (* |(9,2,7)| |(2,1,9)| 1.0))))
(assert (>= |(10,0,1)| 0.0))
(assert (>= |(10,0,1)| (+ 0.0 1.0)))
(assert (>= |(7,2,7)| 0.0))
(assert (>= |(7,2,7)| (+ 0.0 1.0)))
(assert (>= |(9,2,7)| 0.0))
(assert (>= |(9,2,7)| (+ 0.0 1.0)))
(assert (>= |(10, 3)| 0.0))
(assert (>= |(10, 3)| (+ 0.0 1.0)))
(assert (>= |(0,3,0)| 0.0))
(assert (>= |(0,3,0)|
    (+ 0.0 (* |(4,3,0)| (/ 499.0 1000.0)) (* |(10,3,0)| (/ 501.0 1000.0)))))
(assert (>= |(3,3,0)| 0.0))
(assert (>= |(3,3,0)|
    (+ 0.0 (* |(4,3,0)| (/ 499.0 1000.0)) (* |(10,3,0)| (/ 501.0 1000.0)))))
(check-sat)
(exit)
