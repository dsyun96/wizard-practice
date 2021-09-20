;; 프로시저로 쌍을 나타낼 수 있다는 것이 황당하지 않았다면, 프로시저를 다룰
;; 수 있는 언어에서 (양의 정수만 가지고 이야기한다면) 수의 표현을 빌리지 않고,
;; 0과 더하기 1을 다음과 같은 프로시저 연산으로 나타낼 수 있다.
;;
;; (define zero (lambda (f) (lambda (x) x)))
;;
;; (define (add-1 n)
;;   (lambda (f) (lambda (x) (f ((n f) x)))))
;;
;; 이런 표현 방법을 처치의 수(Church numeral)라 하는데, 이는 λ계산법을 처음
;; 만들어 낸 논리학자 처치(Alonzo Church)의 이름을 딴 것으로 알려져 있다.
;; one과 two를 zero와 add-1을 쓰지 않고 곧바로 정의해 보라. (귀띔: 맞바꿈 계산법
;; 으로 (add-1 zero)를 풀어 보라.) 덧셈 프로시저 +를 (add-1을 여러 번 되풀이
;; 하지 말고) 곧바로 정의하라.

(add-1 zero)
;; 인자 먼저 계산법으로 풀어쓰면 다음과 같다.
;; -> (add-1 (lambda (f) (lambda (x) x)))
;; -> (lambda (g) (lambda (y) (g (((lambda (f) (lambda (x) x)) g) y)))))
;; -> (lambda (g) (lambda (y) (g y)))

(define one (lambda (f) (lambda (x) (f x))))



(add-1 one)
;; 정의대로 계산법으로 풀어쓰면 다음과 같다.
;; -> (lambda (f) (lambda (x) (f ((one f) x))))
;; -> (lambda (f) (lambda (x) (f (((lambda (g) (lambda (y) (g y)))) f) x))))
;; -> (lambda (f) (lambda (x) (f ((lambda (y) (f y)) x))))
;; -> (lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))



(define (add a b)
  (lambda (f) (lambda(x) ((a f)
                          ((b f) x)))))
