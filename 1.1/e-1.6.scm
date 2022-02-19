(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause) 
        (else else-clause)))

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
   (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (sqrt x) (sqrt-iter 1.0 x))


;(display (new-if (good-enough? 1 9) "yes" "no"))
(display (sqrt 9.0))
(newline)

; when we run this script it exceeds maximum depth of recursion
; because new-if as opposed to if have applicative-order evaluation method
; 