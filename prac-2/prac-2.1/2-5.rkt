;; 오로지 수와 산술 연산만으로 양의 정수 쌍도 표현해 보자. 정수 a, b 쌍을 2^a*3^b
;; 로 나타낼 때, 이에 알맞은 cons, car, cdr 프로시저를 정의해 보라.

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (log-count n b)
  (if (= (remainder n b) 0)
      (+ (log-count (/ n b) b) 1)
      0))

(define (car z)
  (log-count z 2))

(define (cdr z)
  (log-count z 3))

(cons 5 3)
(car (cons 5 3))
(cdr (cons 5 3))

;; output:
;; 864
;; 5
;; 3
