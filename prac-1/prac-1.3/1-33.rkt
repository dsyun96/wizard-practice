;; 거르개(filter)라는 개념을 끌어들여, 연습문제 1.32에 나온 accumulate의 쓰임새를
;; 더 넓혀 보자. 다시 말해, 정해진 넓이에 속하는 값 가운데 어떤 조건을 만족하는
;; 값만 묶고 나머지는 걸러내는 accumulate를 만든다는 얘기다. 이 프로시저를
;; filtered-accumulate라 한다. filtered-accumulate는 accumulate와 같은 인자를 받으며,
;; 아울러 거르개로 쓸 술어 프로시저(predicate)까지 받아야 한다.
;; filtered-accumulate로 다음 문제의 답이 되는 식을 써 보라.

(define (filtered-accumulate combiner null-value predicate term a next b)
  (cond ((> a b) null-value)
        ((predicate a) (combiner (term a)
                       (filtered-accumulate combiner null-value predicate term (next a) next b)))
        (else (filtered-accumulate combiner null-value predicate term (next a) next b))))



;; a. (prime? 프로시저가 벌써 있다 치고) a에서 b 사이에 있는 모든 소수(씨수)를
;; 제곱하여 더하는 식

(define (prime? x)
  (define (iter now x)
    (cond ((< x 2) #f)
          ((> (* now now) x) #t)
          ((= (remainder x now) 0) #f)
          (else (iter (+ now 1) x))))
  (iter 2 x))

(define (square x) (* x x))
(define (add x y) (+ x y))
(define (inc x) (+ x 1))

(filtered-accumulate add 0 prime? square 1 inc 10)  ; output - 87



;; b. n과 서로소(씨)인 수, 즉 i < n이고 0보다 큰 정수 i가 GCD(i, n) = 1이 되는,
;; n보다 작고 0보다 큰 모든 정수를 곱하는 식

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (coprime? x)
  (= 1 (gcd x n)))

(define (identity x) x)
(define (mul x y) (* x y))
(define (inc x) (+ x 1))
(define n 50)

(filtered-accumulate mul 1 coprime? identity 1 inc (- n 1))  ; output - 19787798161590610642439949
