; Translate following expression into prefix form
; (5+4+ (2-(3-(6+4/3))))
; ________________________
; 3(6-2)*(2-7)

(display (+ 5 4 (- 2 (- 3 (+ 6 4/3)))))
(newline)
(display (* 3 (- 6 2) (- 2 7)))
(newline)

(display (/ (+ 5 4 (- 2 (- 3 (+ 6 4/3)))) (* 3 (- 6 2) (- 2 7))))
(newline)


