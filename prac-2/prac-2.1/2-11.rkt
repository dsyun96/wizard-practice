;; 또, Ben은 지나가다가 살짝 귀띔하기를 '구간 양 끝점의 부호가 어떻게 되는지
;; 검사하면, mul-interval 프로시저는 계산하는 방법을 아홉 가지 경우로 나타낼
;; 수 있는데, 그 중 두 번 이상 곱셈 할 일은 한 번밖에 없다'고 한다. Ben이
;; 제안한 대로 mul-interval 프로시저를 다시 짜보라.

(define (contain-zero? interval)
  (and (>= (lower-bound interval) 0)
       (<= (upper-bound interval) 0)))

(define (pos-interval? interval) (> (lower-bound interval) 0))
(define (neg-interval? interval) (< (upper-bound interval) 0))

(define (mul-interval x y)
  (let ((lx (lower-bound x))
        (ux (upper-bound x))
        (ly (lower-bound y))
        (uy (upper-bound y)))
    (cond ((and (pos-interval? x)
                (pos-interval? y)) (make-interval (* lx ly) (* ux uy)))
          ((and (neg-interval? x)
                (neg-interval? y)) (make-interval (* ux uy) (* lx ly)))
          ((and (pos-interval? x)
                (neg-interval? y)) (make-interval (* ux ly) (* lx uy)))
          ((and (neg-interval? x)
                (pos-interval? y)) (make-interval (* lx uy) (* ux ly)))
          ((and (neg-interval? x)
                (contain-zero? y)) (make-interval (* lx uy) (* lx ly)))
          ((and (pos-interval? x)
                (contain-zero? y)) (make-interval (* ux ly) (* ux uy)))
          ((and (contain-zero? x)
                (neg-interval? y)) (make-interval (* ux ly) (* lx ly)))
          ((and (contain-zero? x)
                (pos-interval? y)) (make-interval (* lx uy) (* ux uy)))
          (else (make-interval (min (* lx uy)
                                    (* ux ly))
                               (max (* lx ly)
                                    (* ux uy)))))))
