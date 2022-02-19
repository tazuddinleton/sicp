; Block Structure & Lexical Scoping 
(define (sqrt x)
    (define (sqrt-iter guess x)
        (if(good-enough? guess (improve guess)) 
            guess
            (sqrt-iter (improve guess) x)))
    (define (good-enough? guess new-guess)
        (display (list "guess: " guess "new-guess: " new-guess))
        (newline)
        (= (abs (- guess new-guess)) 0))
    (define (improve guess)
        (average guess (/ x guess)))
    (define (average x y) (/ (+ x y) 2))

    (sqrt-iter 1.0 x))

(display (sqrt 81))
(newline)