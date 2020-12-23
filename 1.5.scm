; Exercise 1.5: Ben Bitdiddle has invented a test to determine whether the
; interpreter he is faced with is using applicative-order evaluation or
; normal-order evaluation. He defines the following two procedures:

; (define (p) (p))
; (define (test x y)
;   (if (= x 0) 0 y))

; Then he evaluates the expression

; (test 0 (p))

; What behavior will Ben observe with an interpreter that uses
; applicative-order evaluation? What behavior will he observe with an
; interpreter that uses normal-order evalu- ation? Explain your answer. (Assume
; that the evaluation rule for the special form if is the same whether the
; interpreter is using normal or applicative order: The predicate expression is
; evaluated first, and the result determines whether to evaluate the consequent
; or the alternative expression.)

; Answer:

; applicative-order:
;   evaluates arguments as they are passed so, (test 0 (p)) would evaluate the
;   argument (p) as it passed it to the body of `test`
; normal-order:
;   reduces to primatives first and evaluates at the end so, (test 0 (p)) would
;   not evaluate the argument (p) as it passed it to the body of `test` and be ok
;   with just passing p to the body of test

; The difference here is since (p) is infinitely recursive, interpreter using
; applicative-order would never return a value, while one using normal-order
; would not evaluate p and return 0