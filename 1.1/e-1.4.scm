; 
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

(display (a-plus-abs-b 10 -10))
(newline)
; effect
(display (- 10 (- 10)))
