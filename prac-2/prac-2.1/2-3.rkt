;; 연습문제 2.2에서 만든 프로시저를 써서 평면에 네모꼴을 나타내는 데이터를
;; 표현해 보자. 짜맞추개와 고르개를 써서 네모꼴의 둘레와 넓이를 구하는 프로
;; 시저를 정의하라. 이번에는 네모꼴의 표현 방법을 바꾸자. 표현 방법을 바꾸어
;; 도 둘레와 넓이를 구하는 프로시저는 그대로 알맞은 요약의 경계를 갖춘 시스템
;; 을 설계할 수 있는가?

; --- point ---
(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

; --- rectangle ---
(define (make-rect p1 p2) (cons p1 p2))

(define (left-top r) (car r))

(define (right-bottom r) (cdr r))

(define (width-rect r)
  (abs (- (x-point (left-top r)) (x-point (right-bottom r)))))

(define (height-rect r)
  (abs (- (y-point (left-top r)) (y-point (right-bottom r)))))

(define (perimeter-rect r)
  (* 2 (+ (width-rect r)
          (height-rect r))))

(define (area-rect r)
  (* (width-rect r)
     (height-rect r)))

(define rect (make-rect (make-point 1 1)
                        (make-point 3 7)))

(perimeter-rect rect)
(area-rect rect)

;; output:
;; 16
;; 12
