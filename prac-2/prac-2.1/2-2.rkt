;; 평면에 선분을 긋는 문제를 생각해 보자. 모든 선분은 시작점과 끝점의 쌍으로 나타낼 수 있다.
;; 두 점을 짜맞춰 선분을 만들어 내는 make-segment와 선분에서 두 끝점을 골라내는 start-segment,
;; end-segment를 정의하라. 또한, 점도 x 좌표를 나타내는 수와 y 좌표를 나타내는 수를 한 쌍으로
;; 해서 나타낼 수 있다. 그에 따라 make-point와 x-point, y-point를 만들어서 이런 표현 방법을
;; 정의하라. 끝으로 지금까지 만든 짜맞추개와 고르개를 써서, 선분을 인자로 받아 가운데 점(선분의
;; 두 끝점을 평균하여 얻어낸 좌표점)을 내놓는 프로시저 midpoint-segment를 정의하라. 그 다음에
;; 아래와 같이 점의 좌표를 찍어내는 프로시저를 써서 결과가 제대로 나오는지 확인해 보라.
;;
;; (define (print-point p)
;;   (newline)
;;   (display "(")
;;   (display (x-point p))
;;   (display ",")
;;   (display (y-point p))
;;   (display ")"))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment seg) (car seg))

(define (end-segment seg) (cdr seg))

(define (midpoint-segment seg)
  (define (average v1 v2) (/ (+ v1 v2) 2.0))
  (make-point (average (x-point (start-segment seg))
                       (x-point (end-segment seg)))
              (average (y-point (start-segment seg))
                       (y-point (end-segment seg)))))

(define (print-point p)
   (newline)
   (display "(")
   (display (x-point p))
   (display ",")
   (display (y-point p))
   (display ")"))

(print-point (midpoint-segment
                (make-segment
                  (make-point 3 7)
                  (make-point 7 8))))

;; output:
;; (5.0,7.5)
