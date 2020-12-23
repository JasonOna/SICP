; Exercise 1.3: Define a procedure that takes three numbers as arguments and
; returns the sum of the squares of the two larger numbers.

(define (max a b) (if (> a b) a b))
(define (largest a b c) (max a (max b c)))

(define (min a b) (if (< a b) a b))
(define (smallest a b c) (min a (min b c)))

(define (middle a b c) 
        (- (+ a b c)
           (+ (largest a b c) (smallest a b c))))

(define (sum-of-squares a b) (+ (* a a) (* b b)))

(define (sum-two-largest-squares a b c)
        (sum-of-squares (largest a b c) (middle a b c)))

(sum-two-largest-squares 10 -10 2) ;Value: 104