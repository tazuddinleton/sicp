; abs using cond
(define (abs x)
    (cond  ((> x 0) x)
            ((= x 0) 0)
            ((< x 0) (- x))))

(display (list "(abs 10): " (abs 10)))
(newline)
(display (list "(abs -10): " (abs -10)))
(newline)
(display (list "(abs 0): " (abs 0)))
(newline)

; abs using if
(define (abs2 x)
    (if (< x 0)
        (- x)
        x))
        
(display (list "(abs2 10): " (abs2 10)))
(newline)
(display (list "(abs2 -10): " (abs2 -10)))
(newline)
(display (list "(abs2 0): " (abs2 0)))
(newline)
