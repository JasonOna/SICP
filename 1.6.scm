; Exercise 1.6: Alyssa P. Hacker doesn’t see why if needs to be provided as a
; special form. “Why can’t I just define it as an ordinary procedure in terms
; of cond?” she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be
; done, and she defines a new version of if:

; (define (new-if predicate then-clause else-clause)
;         (cond (predicate then-clause)
;         (else else-clause)))

; Eva demonstrates the program for Alyssa:
; (new-if (= 2 3) 0 5) 5
; (new-if (= 1 1) 0 5) 0

; Delighted, Alyssa uses new-if to rewrite the square-root program:
; (define (sqrt-iter guess x)
;         (new-if (good-enough? guess x)
;                 guess
;                 (sqrt-iter (improve guess x) x)))

; What happens when Alyssa attempts to use this to compute square roots?
; Explain.

; Answer

; in `new-if`, the arguments are evaluated with the applicative order. The
; `else-clause` which is a recursive function will always be evaluated since it
; is an argument of this function, but evaluating these recursive calls will
; continually call itself. This is why `if` needs to be provided as a special
; form, in order to prevent subsequent clauses from being evaluated.