; Exercise 1.1: Below is a sequence of expressions. What is the result printed
; by the interpreter in response to each ex- pression? Assume that the sequence
; is to be evaluated in the order in which it is presented.

; 10
;   the value 10

; (+ 5 3 4)
;   the value 12

; (- 9 1)
;   the value 8

; (/ 6 2)
;   the value 3

; (+ (* 2 4) (- 4 6))
;   the value 6

; (define a 3)
;   the value a, which is 3

; (define b (+ a 1))
;   the value b, which is 4

; (+ a b (* a b))
;   the value 19

; (= a b)
;   the value false

; (if (and (> b a) (< b (* a b)))
;   b
;   a)
;   the value 4


; (cond ((= a 4) 6)
;   ((= b 4) (+ 6 7 a))
;   (else 25))
;   the value 16


; (+ 2 (if (> b a) b a))
;   the value 6

; (* (cond ((> a b) a)
;          ((< a b) b)
;          (else -1))
;    (+ a 1))
;   the value 16

; Exercise 1.2: Translate the following expression into prefix form:
; (5 + 4 + (2 − (3 − (6 + 4 / 5)))) / (3(6 − 2)(2 − 7))

; (/ (+ 5 4 (− 2 (− 3 (+ 6 (/ 4 5)))))
;    (* 3 (− 6 2) (− 2 7)))
