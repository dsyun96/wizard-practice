;; 오로지 수와 산술 연산만으로 양의 정수 쌍도 표현해 보자. 정수 a, b 쌍을 2^a*3^b
;; 로 나타낼 때, 이에 알맞은 cons, car, cdr 프로시저를 정의해 보라.

(define (cons a b)
  (lambda (m) (m a b)))

(define (car z)
  (z (lambda (p q) (expt 2 p))))

(define (cdr z)
  (z (lambda (p q) (expt 3 q))))

(car (cons 5 3))
(cdr (cons 5 3))

;; output:
;; 32
;; 27
