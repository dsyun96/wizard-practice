;; Alyssa가 짠 프로그램에서는, 구간 값을 나타내는 요약된 데이터(abstraction)가
;; 있다고 보고 구간 산술 연산을 만들었다. 그러므로 Alyssa의 프로그램을 돌아가게
;; 만들려면, 실제로 구간 데이터를 만들어야 한다. 구간을 짜맞추는 연산이 아래와
;; 같다고 하자.
;;
;; (define (make-interval a b) (cons a b))
;;
;; 이를 바탕으로, 구간의 상한과 하한을 골라내는 upper-bound와 lower-bound를
;; 정의하여 Alyssa의 프로그램을 돌아가게 만들어라.

(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))
