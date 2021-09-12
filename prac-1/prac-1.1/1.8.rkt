(define (my-cbrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average (/ x (* guess guess)) (* 2 guess)))

(define (average x y)
  (/ (+ x y) 3))

(define (good-enough? guess x)
  (= guess (improve guess x)))

