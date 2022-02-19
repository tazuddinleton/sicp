
(define (square x) (* x x))
(define (sum-of-square x y) (+ (square x) (square y)))

(define (sum-of-square-of-two-larger x y z) 
        (cond 
            ((and (> x y) (> y z)) 
                (sum-of-square x y))
            ((and (> x y) (> z y))
                (sum-of-square x z))
            (else (sum-of-square y z))))

(display (list "(sum-of-square-of-two-larger 4 3 2): " (sum-of-square-of-two-larger 4 3 2)))
(newline)
(display (list "(sum-of-square-of-two-larger 5 3 4): " (sum-of-square-of-two-larger 5 3 4)))
(newline)
(display (list "(sum-of-square-of-two-larger 4 3 4): " (sum-of-square-of-two-larger 4 3 4)))
(newline)