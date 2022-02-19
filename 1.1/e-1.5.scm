; a recursive function that repeatedly calls itself
(define (p) (p))
; test takes two args x and y and tests wheather x is 0. 
; if x is zero it returns 0 else returns y
(define (test x y)
    (if (= x 0) 0 y))
; we call the test function with first argument being 0 and second being the recursive
; function p
; if the interpreters' evaluation method is normal-order then the p never called
; if it's applicative-order then the second arg is evaluated immidiately before
; even evaluating the predicate so it hangs up in a recursive loop
(display (test 0 (p)))

; it appears that scheme uses applicative-order evaluation