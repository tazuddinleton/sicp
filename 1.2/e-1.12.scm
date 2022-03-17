; Pascal's triangle


;     1
;     1 1
;     1 2 1
;     1 3 3 1
;     1 4 6 4 1 
;
;


(define (pascal row col)
  (if (or (= row 1) (= col 1)) 
    1
    (+ 
      (pascal (- row 1) (- col 1))
      (pascal (- row 1) col)
    )
    ))

(display (pascal 3 2))
(newline)