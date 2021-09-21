;; Alyssa가 했던 것처럼, 구간 값의 뺄셈을 구하는 방법을 설명하고,
;; 이를 sub-interval 프로시저로 정의하라.

(define (make-inteval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define (sub-interval a b)
  (make-interval (- (lower-bound a)
                    (upper-bound b))
                 (- (upper-bound a)
                    (lower-bound b))))
