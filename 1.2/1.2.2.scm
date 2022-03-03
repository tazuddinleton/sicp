; tree-recursion
(define (fib n)        
        (display (list "fib called with: " n))
        (newline)
        (cond   ((= n 0) 0)
                ((= n 1) 1)
                (else (+        (fib (- n 1))
                                (fib (- n 2))))))

; (display (list "fib 10" (fib 10)))
; (newline)
; (display (list "fib 1" (fib 1)))
; (newline)

; (display (list "fib 2" (fib 2)))
; (newline)

; fib2 is a linear iteration implementation of fibonacci finder
; it grows linearly with the input size n
; on the other hand previous implementation grows exponentially with the input size n
; 
(newline)
(define (fib-iter a b count) 
        (display (list "fib2 called with: " a b count))
        (newline)
        (if (= count 0)
                b
                (fib-iter (+ a b) a (- count 1))))

(define (fib2 n)
        (fib-iter 1 0 n))
; (display (list "fib2 50" (fib2 50)))
; (newline)

; 
; the number of ways to change amount a using a specific kind of coin
; plus the number of ways to change the rest of the amount with all types of coin

; i.e if I have $1.00 amount and i can use one type of coin
; then we can say the number of way to change $1.00 using a $0.50 
; plus the number of ways to change the rest of the 0.50 using all the other types of coins including .50
; 
; 

(define (count-change amount)
        (cc amount 5))
        
(define (cc amount kind-of-coin)
        (display (list "amount: " amount "coin: " kind-of-coin))
        (newline)
        (cond   ((= amount 0) 1)
                ((or (< amount 0) (= kind-of-coin 0)) 0)
                (else (+ (cc amount (- kind-of-coin 1))
                         (cc (- amount (denomination kind-of-coin)) kind-of-coin)))))

(define (denomination kind-of-coin)
        (cond   ((= kind-of-coin 1) 1)
                ((= kind-of-coin 2) 5)
                ((= kind-of-coin 3) 10)
                ((= kind-of-coin 4) 25)
                ((= kind-of-coin 5) 50)))

(display (list "possible change: " (count-change 100)))
(newline)
; (display (denomination 1))
; (newline)