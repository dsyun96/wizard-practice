;; f와 g가 모두 인자 하나를 받는 프로시저라 하자. g와 f의 합성(composition)
;; 함수는 x ↦ f(g(x))로 정의한다. 두 프로시저를 합성하는 프로시저 compose를
;; 정의하라. 예를 들어 inc가 인자에 1을 더하는 함수라면 다음 결과가 나온다.
;;
;; ((compose square inc) 6)
;; 49

(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))
(define (inc x) (+ x 1))

((compose square inc) 6)

;; output:
;; 49
