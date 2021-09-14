;; 1.2.2절에 나온 황금비 φ가 x ↦ 1+1/x 함수의 고정점이라는 것을 밝히고,
;; 이런 사실을 바탕으로 fixed-point 프로시저로 φ를 찾아보라.

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1.0 x))) 1.0)  ; output - 1.6180327868852458

;; x = 1 + 1/x
;; -> x^2 = x + 1
;; -> x^2 - x - 1 = 0
;; -> x = (1 + sqrt(5)) / 2 = φ
