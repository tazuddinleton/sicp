; if y is a guess for cube root for x 
; then (x/y^2 + 2y)/3 is a better approximation

(define (cuberoot-iter guess x)
    (if(good-enough? guess (improve guess x))
        guess
        (cuberoot-iter (improve guess x) x)))

(define (good-enough? guess new-guess)
    (display (list "guess: " guess "new-guess: " new-guess))
    (newline)
    (= (abs(- guess new-guess)) 0))


(define (improve guess x)
    (/ (+ (/ x (square guess)) (* guess 2)) 3))

(define (cuberoot x) (cuberoot-iter 1.0 x))
(display (cuberoot .0001))
(newline)