; Exercise 1.4: Observe that our model of evaluation allows for combinations
; whose operators are compound expressions. Use this observation to describe
; the behavior of the following procedure:
;
; (define (a-plus-abs-b a b)
;   ((if (> b 0) + -) a b))

; `+` and `-` are first order so depending on the condition of b being greater
; than 0, either procedure is returned. So, for example, if a was 2 and b was 1
; or -1, we would have (+ 2 1) or (- 2 -1), both giving us 3.