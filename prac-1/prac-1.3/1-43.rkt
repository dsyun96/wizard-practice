;; f가 수를 계산하는 함수고 n이 0보다 큰 정수일 때, n번 f하는 함수는 x를 받아
;; f(f(...(f(x))...))하는 함수다. 이를테면 f가 x ↦ x+1일 때, n번 f한 함수는
;; x ↦ x+n이다. f가 제곱 함수면, n번 f한 함수는 인자의 2^n 값을 구한다.
;; f 프로시저와 0보다 큰 정수 n을 인자로 받아 f를 n번 하는 함수를 내놓는
;; 프로시저를 짜라. 이 프로시저를 쓰는 방법은 다음과 같다.
;;
;; ((repeated square 2) 5)
;; 625
;;
;; (귀띔: 연습문제 1.42에서 만든 compose를 쓰면 문제가 쉽게 풀린다.)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter i)
    (if (= i 1)
        f
        (compose f (iter (- i 1)))))
  (iter n))

(define (square x) (* x x))

((repeated square 3) 5)

;; output:
;; 390625
