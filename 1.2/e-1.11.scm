; f(n) = n | when n < 3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) | when n >= 3

; recursive approach
(define (f-recur n)
    (display (list "n: " n))
    (newline)
    (cond   ((< n 3) n)
            ((>= n 3) 
                (+ (f-recur (- n 1))
                    (* 2 (f-recur (- n 2)))
                    (* 3 (f-recur (- n 3)))))))

(define (run-f-recur n)
    (display (list "(f-recur" n "): " (f-recur n))))

(run-f-recur 4)
(newline)

; todo: iterative approach
; 








(define (run-f-iter n)
    (display (list "f-iter" n ": " (f-iter n (- n 1)))))
(run-f-iter 4)
(newline)