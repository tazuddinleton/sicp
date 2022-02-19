; newtons method for finding square root
(define (sqrt-iter guess x)
    (display (list "guess" guess "x" x))
    (newline)
    (if(good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
    (display (list "diff : " (abs (- (square guess) x))))
    (newline)
    (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (sqrt x)
    (sqrt-iter 1.0 x))


; (display (sqrt .0001))
; (newline)

; the good-enough? fails for following small input
; the square root of .0001 is .01 wheareas 
; it generates .03230844833048122, which is wrong apparently
; it's because the guess abs(0.001 - .03230844833048122 x .03230844833048122) is less than 0.001


; (display (sqrt 9007199254740991))
; (newline)

; when we run this the guess and the difference we get
; (guess 1. x 9007199254740991)
; (diff :  9007199254740990.)
; (guess 4503599627370496. x 9007199254740991)
; (diff :  2.0282409603651661e31)
; (guess 2251799813685249. x 9007199254740991)
; (diff :  5.070602400912913e30)
; (guess 1125899906842626.5 x 9007199254740991)
; (diff :  1.267650600228226e30)
; (guess 562949953421317.2 x 9007199254740991)
; (diff :  3.1691265005705425e29)
; (guess 281474976710666.6 x 9007199254740991)
; (diff :  7.922816251426131e28)
; (guess 140737488355349.3 x 9007199254740991)
; (diff :  1.9807040628563076e28)
; (guess 70368744177706.66 x 9007199254740991)
; (diff :  4.951760157138517e27)
; (guess 35184372088917.33 x 9007199254740991)
; (diff :  1.2379400392823775e27)
; (guess 17592186044586.664 x 9007199254740991)
; (diff :  3.0948500981834258e26)
; (guess 8796093022549.332 x 9007199254740991)
; (diff :  7.7371252452333845e25)
; (guess 4398046511786.666 x 9007199254740991)
; (diff :  1.9342813110831661e25)
; (guess 2199023256917.333 x 9007199254740991)
; (diff :  4.8357032754561155e24)
; (guess 1099511630506.6665 x 9007199254740991)
; (diff :  1.208925816612229e24)
; (guess 549755819349.3333 x 9007199254740991)
; (diff :  3.0223145190125745e23)
; (guess 274877917866.66656 x 9007199254740991)
; (diff :  7.555786072351463e22)
; (guess 137438975317.33264 x 9007199254740991)
; (diff :  1.8889462929079117e22)
; ...... .... 
; (guess 155875512.60229486 x 9007199254740991)
; (diff :  15289976174287192.)
; (guess 106830040.61305924 x 9007199254740991)
; (diff :  2405458322646895.)
; (guess 95571698.34882891 x 9007199254740991)
; (diff :  126750270538555.)
; (guess 94908582.21335998 x 9007199254740991)
; (diff :  439723009119.)
; (guess 94906265.65252393 x 9007199254740991)
; (diff :  5366453.)
; (guess 94906265.62425154 x 9007199254740991)
; (diff :  1.)
; (guess 94906265.62425154 x 9007199254740991)
; (diff :  1.)
; (guess 94906265.62425154 x 9007199254740991)
; after that it never changes the difference is always 1 
; in reality the change is beyond the capacity of the machine. 
; as the guess starts getting closer to the square root the 
; difference is also so little that the current capacity of floating point number
; can't handle that


; defining new good-enough? comparing prev guess and current guess
; and checking the difference wheather it is changing enough
; if the change is less than a threshold we stop
(define (new-good-enough? guess new-guess)
    (display (list "guess: " guess "new-guess: " new-guess "diff: " (abs (- guess new-guess))))
    (newline)
    (= (abs (- guess new-guess)) 0))

(define (new-sqrt-iter guess x)       
    (if(new-good-enough? guess (improve guess x))
        guess
        (new-sqrt-iter (improve guess x) x)))

(define (new-sqrt x) (new-sqrt-iter 1.0 x))


(display (new-sqrt 9007199254740991))
(newline)
; new-good-enough? implementation works better than the previous one
; (guess:  1. new-guess:  4503599627370496. diff:  4503599627370495.)
; (guess:  4503599627370496. new-guess:  2251799813685249. diff:  2251799813685247.)
; (guess:  2251799813685249. new-guess:  1125899906842626.5 diff:  1125899906842622.5)
; (guess:  1125899906842626.5 new-guess:  562949953421317.2 diff:  562949953421309.25)
; (guess:  562949953421317.2 new-guess:  281474976710666.6 diff:  281474976710650.62)
; (guess:  281474976710666.6 new-guess:  140737488355349.3 diff:  140737488355317.31)
; (guess:  140737488355349.3 new-guess:  70368744177706.66 diff:  70368744177642.66)
; (guess:  70368744177706.66 new-guess:  35184372088917.33 diff:  35184372088789.33)
; (guess:  35184372088917.33 new-guess:  17592186044586.664 diff:  17592186044330.664)
; (guess:  17592186044586.664 new-guess:  8796093022549.332 diff:  8796093022037.332)
; (guess:  8796093022549.332 new-guess:  4398046511786.666 diff:  4398046510762.666)
; (guess:  4398046511786.666 new-guess:  2199023256917.333 diff:  2199023254869.333)
; (guess:  2199023256917.333 new-guess:  1099511630506.6665 diff:  1099511626410.6665)
; (guess:  1099511630506.6665 new-guess:  549755819349.3333 diff:  549755811157.33325)
; (guess:  549755819349.3333 new-guess:  274877917866.66656 diff:  274877901482.6667)
; (guess:  274877917866.66656 new-guess:  137438975317.33264 diff:  137438942549.33392)
; (guess:  137438975317.33264 new-guess:  68719520426.66112 diff:  68719454890.671524)
; (guess:  68719520426.66112 new-guess:  34359825749.288895 diff:  34359694677.372223)
; (guess:  34359825749.288895 new-guess:  17180043946.311115 diff:  17179781802.97778)
; (guess:  17180043946.311115 new-guess:  8590284114.488924 diff:  8589759831.822191)
; (guess:  8590284114.488924 new-guess:  4295666323.91217 diff:  4294617790.5767536)
; (guess:  4295666323.91217 new-guess:  2148881567.3227453 diff:  2146784756.589425)
; (guess:  2148881567.3227453 new-guess:  1076536571.3938634 diff:  1072344995.9288819)
; (guess:  1076536571.3938634 new-guess:  542451701.0560025 diff:  534084870.33786094)
; (guess:  542451701.0560025 new-guess:  279528155.8182294 diff:  262923545.23777312)
; (guess:  279528155.8182294 new-guess:  155875512.60229486 diff:  123652643.21593451)
; (guess:  155875512.60229486 new-guess:  106830040.61305924 diff:  49045471.989235625)
; (guess:  106830040.61305924 new-guess:  95571698.34882891 diff:  11258342.264230326)
; (guess:  95571698.34882891 new-guess:  94908582.21335998 diff:  663116.13546893)
; (guess:  94908582.21335998 new-guess:  94906265.65252393 diff:  2316.560836046934)
; (guess:  94906265.65252393 new-guess:  94906265.62425154 diff:  2.8272390365600586e-2)
; (guess:  94906265.62425154 new-guess:  94906265.62425154 diff:  0.)
; 94906265.62425154

(display (new-sqrt 0.0001))
(newline)
; for smaller number: 0.0001
; (guess:  1. new-guess:  .50005 diff:  .49995)
; (guess:  .50005 new-guess:  .2501249900009999 diff:  .24992500999900008)
; (guess:  .2501249900009999 new-guess:  .12526239505846617 diff:  .12486259494253374)
; (guess:  .12526239505846617 new-guess:  .06303035962394365 diff:  .06223203543452252)
; (guess:  .06303035962394365 new-guess:  .03230844833048122 diff:  3.0721911293462432e-2)
; (guess:  .03230844833048122 new-guess:  1.7701806998329746e-2 diff:  1.4606641332151477e-2)
; (guess:  1.7701806998329746e-2 new-guess:  1.1675473894984788e-2 diff:  6.026333103344958e-3)
; (guess:  1.1675473894984788e-2 new-guess:  1.0120218365353947e-2 diff:  1.555255529630841e-3)
; (guess:  1.0120218365353947e-2 new-guess:  1.0000714038711746e-2 diff:  1.1950432664220058e-4)
; (guess:  1.0000714038711746e-2 new-guess:  1.0000000025490743e-2 diff:  7.140132210030348e-7)
; (guess:  1.0000000025490743e-2 new-guess:  .01 diff:  2.5490743196798782e-11)
; (guess:  .01 new-guess:  .01 diff:  0.)
; .01


; it can be seen that the difference between guess and new-guess getting smaller and smaller as 
; we approach closer to square root
; we stop when the diff is 0
