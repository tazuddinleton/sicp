(display 10)
(newline)

(display (list "(+ 5 3 4): " (+ 5 3 4)))
(newline)

(display (list "(- 9 1): " (- 9 1)))
(newline)

(display (list "(/ 6 2): " (/ 6 2)))
(newline)

(display (list "(+ (* 2 4) (- 4 6)): " (+ (* 2 4) (- 4 6))))
(newline)

(define a 3)
(define b (+ a 1))
(display (list "(+ a b (* a b)): " (+ a b (* a b))))
(newline)

(display (list "(= a b): " (= a b)))
(newline)
(display "(if (and (> b a) (< b (* a b)))
    b
    a
")
(if (and (> b a) (< b (* a b)))
    (display b)
    (display a))

(newline)

(cond   ((= a 4) (display 6))
        ((= b 4) (display (+ 6 7 a)))
        (else (display 25)))
(newline)

(display (list "(+ 2 (if (> b a) b a)): " (+ 2 (if (< b a) b a))))
(newline)

(display 
    (* (cond ((> b a) a)
             ((< b a) b)
             (else -1))
        (+ a 1)))
(newline)