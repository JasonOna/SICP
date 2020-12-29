; Exercise 1.9: Each of the following two procedures defines a method for
; adding two positive integers in terms of the procedures inc, which increments
; its argument by 1, and dec, which decrements its argument by 1.

; (define (+ a b)
;   (if (= a 0) b (inc (+ (dec a) b))))
; (define (+ a b)
;   (if (= a 0) b (+ (dec a) (inc b))))

; Using the substitution model, illustrate the process gener- ated by each
; procedure in evaluating (+ 4 5). Are these processes iterative or recursive?

; Solution


; (define (+ a b)
;   (if (= a 0) b (inc (+ (dec a) b))))

 ; (+ 4 5)
 ; (inc (+ 3 5))
 ; (inc (inc (+ 2 5)))
 ; (inc (inc (inc (+ 1 5))))
 ; (inc (inc (inc (inc (+ 0 5)))))
 ; (inc (inc (inc (inc 5))))
 ; (inc (inc (inc 6)))
 ; (inc (inc 7))
 ; (inc 8)
 ; 9

; This process is linear recursive
; * deffered operation of inc with an expansive shape 
; * has hidden information not in variables
; * note: this highlights the need for a stack in hardware
;   (footnote 30 in ch 1)

; (define (+ a b)
;   (if (= a 0) b (+ (dec a) (inc b))))

; (+ 4 5)
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
; 9

; This process is linear iterative
; * does not grow or expand, fixed state variables a and b

