;; Lem의 말이 옳다는 것을 실험으로 알아보자. 그러려면, 여러 가지 계산식을 
;; 가지고 Alyssa가 만든 시스템이 어떻게 돌아가는지 살펴봐야 알 수 있다.
;; 구간 값 A, B가 있고 A/A와 A/B를 구할 때, Alyssa가 만든 시스템을 써보라.
;; 이 문제에 대한 문제점을 제대로 알아보려면, 가운데 값의 폭이 아주 작은
;; 퍼센트 값을 가진다고 해놓고 문제를 풀어야 한다. (연습문제 2.12의)
;; 중간값 - 퍼센트 꼴로 실현해 보라.

(define (make-interval x y) (cons x y))

(define (lower-bound i) (car i))

(define (upper-bound i) (cdr i))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
 
(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define (make-center-percent c p)
  (let ((value (* c (/ p 100.0))))
    (make-interval (- c value)
                   (+ c value))))

(define a (make-center-percent 10 0.1))
(define b (make-center-percent 20 0.03))

(display (par1 a a))
(newline)
(display (par2 a a))

;; output:
;; (4.98501998001998 . 5.015020020020019)
;; (4.995 . 5.005)

(display (par1 a b))
(newline)
(display (par2 a b))

;; output:
;; (6.6544529584221745 . 6.6788974119530415)
;; (6.661554829242263 . 6.671777052238806)
