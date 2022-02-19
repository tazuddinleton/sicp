
(define hi "hello world")
(display 
    (list "hi: " hi))    
(newline)

(define size 2)
(display (list "size: " size))
(newline)

(display 
    (list "(* 5 size): " (* 5 size)))
(newline)
; define pi and radius 10 to calculate circumference
(define pi 3.14159)
(define radius 10)

(display 
    (list   "(* pi (* radius radius)): " 
                    (* pi (* radius radius))))
(newline)

(define circumference (* 2 pi radius))
(display 
    (list "circumference: " circumference))
(newline)

(define five (+ 2 3)) 
(define (add x y) (+ x y))
(display 
    (list "(add 10 30): " (add 10 30)))
(newline)
(display 
    (list "(add 5 8): " (add 5 8)))
(newline)

; square 
(define (square x) (* x x))
(display 
    (list "(square 7): " (square 7)))
(newline)

; x^2 + y^2
(display 
    (list "(+ (square 2) (square 3)): " 
        (+ (square 2) (square 3))))
(newline)

; sum-of-squares
(define (sum-of-squares x y) 
    (+ (square x) (square y) ))
(display 
    (list "(sum-of-squares 2 3): " 
        (sum-of-squares 2 3)))
(newline)

(display 
    (list "(sum-of-squares 3 4): " 
        (sum-of-squares 3 4)))
(newline)

(define (f a)
    (sum-of-squares (+ a 1) (* a 2)))
(display (list  '(f 5) (f 5)))
(newline)