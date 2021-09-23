;; Alyssa의 시스템을 써본 또 다른 사용자 Eva Lu Ator는 대수적으로 같은
;; 식이지만 다른 식이 있을 때 계산된 구간 값이 다르게 나오는 문제점을
;; 또 알아차렸다. Alyssa의 시스템으로 구간 계산을 할 때 부정확한 수를
;; 나타내는 변수가 있는데, 그 변수를 되풀이해서 쓰지 않는 어떤 공식을
;; 쓸 수 있으면, 그 공식이 오차 범위를 더 줄인다고 했다. 그렇게 보면,
;; 병렬 저항을 구할 때 같은 병렬 저항을 구하는 공식이라 하더라도 par2가
;; par1보다 나은 프로그램이라고 말했다. 이 말이 옳은가? 그렇다면 그
;; 까닭은 무엇인가?

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

;; r1 = (x1, y1)
;; r2 = (x2, y2)
;;
;; (par1 r1 r2)
;; -> (div-interval (mul-interval r1 r2)
;;                  (add-interval r1 r2))
;; -> (mul-interval (mul-interval r1 r2)
;;                  (make-interval (/ 1.0 (upper-bound (add-interval r1 r2)))
;;                                 (/ 1.0 (lower-bound (add-interval r1 r2)))))
;; -> (mul-interval (make-interval (min (* x1 y1) (* x1 y2) (* x2 y1) (* x2 y2))
;;                                 (max (* x1 y1) (* x1 y2) (* x2 y1) (* x2 y2)))
;;                  (make-interval (/ 1.0 (+ x1 x2))
;;                                 (/ 1.0 (+ y1 y2))))
;; -> (mul-interval (make-interval t1 t2)
;;                  (make-interval (/ 1.0 (+ x1 x2))
;;                                 (/ 1.0 (+ y1 y2))))
;;
;; (par2 r1 r2)
;; -> (div-interval (make-interval 1 1)
;;                  (add-interval (div-interval (make-interval 1 1) r1)
;;                                (div-interval (make-interval 1 1) r2)))
;; -> (div-interval (make-interval 1 1)
;;                  (add-interval (mul-interval (make-interval 1 1)
;;                                              (make-interval (/ 1.0 y1) (/ 1.0 x1)))
;;                                (mul-interval (make-interval 1 1)
;;                                              (make-interval (/ 1.0 y2) (/ 1.0 x2)))))
;; -> (div-interval (make-interval 1 1)
;;                  (add-interval (make-interval (/ 1.0 y1) (/ 1.0 x1))
;;                                (make-interval (/ 1.0 y2) (/ 1.0 x2))))
;; -> (div-interval (make-interval 1 1)
;;                  (make-interval (+ (/ 1.0 y1) (/ 1.0 y2))
;;                                 (+ (/ 1.0 x1) (/ 1.0 x2))))
;; -> (mul-interval (make-interval 1 1)
;;                  (make-interval (/ 1.0 (+ (/ 1.0 x1) (/ 1.0 x2)))
;;                                 (/ 1.0 (+ (/ 1.0 y1) (/ 1.0 y2)))))
;; -> (make-interval (/ 1.0 (+ (/ 1.0 x1) (/ 1.0 x2)))
;;                   (/ 1.0 (+ (/ 1.0 y1) (/ 1.0 y2))))
;;
;; 식으로 풀어서 써보면 뭐가 보일 줄 알았는데 그런 것 같진 않다 (...)
;; 그래서 적당히 문제에 있는 말을 참고하여 추측해 보자면...
;; 인자로 주어지는 r1, r2가 "부정확한 수를 나타내는 변수"이고
;; par1에서는 r1, r2를 이용해서 구간 곱과 합을 계산하고 나눠준다.
;; par2에서는 r1, r2를 각각 한 번만 이용해서 역수의 합의 역수를 구한다.
;; 따라서, r1과 r2를 2번 되풀이해서 사용한 par1의 오차 범위가 크고
;; par2의 오차 범위는 작은 결과가 나오는 것으로 보인다.
