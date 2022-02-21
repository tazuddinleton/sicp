; Ackermann's function

(define (A x y)
    (cond   ((= y 0) 0)
            ((= x 0) (* 2 y))
            ((= y 1) 2)
            (else (A (- x 1) 
                     (A x (- y 1))))))


(display (list "(A 1 10): " (A 1 10)))  ; 1024
(newline)
(display (list "(A 2 4): " (A 2 4)))   ; 65536
(newline)
(display (list "(A 3 3): " (A 3 3)))   ; 65536
(newline)

(define INPUT 4)

; 2n
(define (f n) (A 0 n))
(display (list "f with input " INPUT ": " (f INPUT)))        
(newline)
; 2^n
(define (g n) (A 1 n))
(display (list "g with input " INPUT ": " (g INPUT)))
(newline)
; A(2 n)
(define (h n) (A 2 n))
(display (list "h with input " INPUT ": " (h INPUT)))
(newline)

(define (k n) (* 5 n n))
(display (list "k with input " INPUT ": " (k INPUT)))
(newline)