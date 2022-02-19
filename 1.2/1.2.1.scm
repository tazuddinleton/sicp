(define (factorial n)
    (display (list n "* factorial " (- n 1)))
    (newline)
    (if (= n 1)
        1
        (* n (factorial (- n 1)))))
(display (factorial 6))
(newline)


(define (factorial2 n)
    (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
    (display (list "product: " product "counter: " counter "max-count: " max-count))
    (newline)
    (if (> counter max-count)
        product
        (fact-iter (* product counter) (+ counter 1) max-count)))
(display (factorial2 6))
(newline)