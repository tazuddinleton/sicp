(define (move n t1 t2 t3)
    (cond ((= n 0) ())
          (else 
                (move (- n 1) t1 t3 t2)
                (display (list "move disk" n "from" t1 "to" t2))
                (newline)
                (move (- n 1) t3 t2 t1))))

(define (hanoi n)
    (move n "tower 1" "tower 2" "tower 3"))

(hanoi 6)