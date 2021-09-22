;; 구간의 가운데 값과 허용 오차를 인자로 받되, 허용 오차는 퍼센트 단위로 넘겨
;; 받아서 구간 값을 만드는 make-center-percent를 정의하라. 또, 구간 값에서
;; 허용 오차가 몇 퍼센트인지 알아보는 percent 프로시저도 정의하라. 구간의
;; 가운데 값을 골라내는 center 프로시저는 바로 앞에 나온 것과 같다.

(define (make-center-percent c p)
  (let ((value (* c (/ p 100.0))))
    (make-interval (- c value)
                   (+ c value))))

(define (percent interval)
  (let ((center (/ (+ (lower-bound interval)
                      (upper-bound interval))
                   2.0)))
    (/ (* (- (upper-bound interval) center) 100.0)
       center)))
