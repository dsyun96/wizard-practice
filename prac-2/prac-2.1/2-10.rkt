;; 전문 시스템 프로그래머 Ben Bitdiddle는 Alyssa가 한 일을 어깨 너머로 보다가,
;; 0이 들어 있는 구간 값으로 나누어야 할 때 무슨 일을 하는지 깨끗하게 드러나지
;; 않는다고 했다. 구간에 0이 들어 있는지 따져서 문제가 생겼을 때 잘못되었다고
;; 알려줄 수 있도록, Alyssa의 코드를 고쳐 보아라.

(define (div-interval x y)
  (define (contains-zero? interval)
    (and (>= (lower-bound interval) 0)
         (<= (upper-bound interval) 0)))
  (if (contains-zero? y)
      (error "Division by interval containing zero")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))
