;; 삼차 방정식 x^3 + ax^2 + bx + c의 해에 가까운 값을 구하기 위하여 newtons-method로
;; 다음 식을 계산한다고 할 때, 이 식에서 쓰는 프로시저 cubic을 짜보라.
;;
;; (newtons-method (cubic a b c) 1)

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define dx 0.00001)

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

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

(newtons-method (cubic 1 1 1) 1)

;; output:
;; -0.9999999999997796
