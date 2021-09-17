;; 함수를 다듬는(smoothing) 생각은 신호 처리에서 중요한 개념이다. f가 함수이고
;; dx가 작은 수일 때, f를 다듬는 함수는 x에서 f(x-dx), f(x), f(x+dx)의
;; 평균값을 내놓는 함수다. f를 인자로 받아서, 다듬은 함수를 내놓는 프로시저
;; smooth를 짜라. 또 n-번 다듬은 함수(n-fold smoothed function)를 구하는 게
;; 쓸모 있을 때가 있다. smooth와 연습문제 1.43의 repeated로 어떤 함수를 n-번
;; 다듬은 함수는 어떻게 만드는지 밝혀라.

(define (smooth f)
  (define dx 0.000001)
  (define (average a b c) (/ (+ a b c) 3.0))
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

((smooth (lambda (x) (* x x))) 7)

;; output:
;; 49.00000000000066



(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter i)
    (if (= i 1)
        f
        (compose f (iter (- i 1)))))
  (iter n))

(define (n-fold-smoothed f n)
  ((repeated smooth n) f))

((n-fold-smoothed (lambda (x) (* x x)) 10) 7)

;; output:
;; 49.00000000000667
