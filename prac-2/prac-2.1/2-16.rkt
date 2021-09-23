;; 흔히 대수적으로 같은 식들이 왜 다른 결과를 내놓는지 설명하라. 이런 흠이
;; 없도록, 구간-산술 연산 꾸러미를 만들 수 있는가? 아니면 이런 일은 불가능
;; 한 일인가? (경고: 이 문제는 아주 어렵다.)

(define (make-interval a b) (cons a b))
 
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
 
(define a (make-interval 2 4))
 
(define b (make-interval -2 0))
 
(define c (make-interval 3 8))
 
(define x (mul-interval a
                        (add-interval b c)))
 
(define y (add-interval (mul-interval a b)
                        (mul-interval a c)))
 
(display x)
(newline)
(display y)

;; output:
;; (2 . 32)
;; (-2 . 32)
;;
;; 대수적으로 a(b+c) = ab+ac 이지만, 구간 시스템에서는 성립하지 않는다.
