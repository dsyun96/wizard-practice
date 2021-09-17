;; 1.3.3절에서 곧바로 y ↦ x/y 함수의 고정점을 얻으려고 할 때 함수 값이
;; 고정점에 다가가지 못하고 들쑥날쑥해서, 이 값을 평균내어 잠재워서 풀었다.
;; 이와 비슷하게, y ↦ x/y^2 함수의 고정점을 구하여 세제곱근을 계산할 때에도
;; 평균내어 잦아들게 할 수 있다. 하지만, 네제곱근은 이렇게 되지 않는다. 다시
;; 말해서, y ↦ x/y^3 함수는 평균 잠재우기를 한 번 써봤자 고정점으로 다가가지 않는다.
;; 그런데 두 번 하면, 다시 말해서 평균내어 잦아들게 한 것을 다시 한번 더
;; 평균내어 잦아들게 하면 고정점에 다가간다. y ↦ x/y^(n-1)을 평균내어 여러 번
;; 잦아들게 하여 고정점 찾기로 n번째 제곱근을 구한다고 할 때, 몇 번 잦아들게
;; 하는지 실험으로 알아보라. 이를 바탕으로 fixed-point, average-damp, 연습문제
;; 1.43의 repeated를 써서 n번째 제곱근을 얻는 프로시저를 만들어 보자.
;; 이 프로시저를 만드는 과정에서 꼭 필요한 수 연산은 모두 기본(primitive) 연산
;; 이라고 해두자.

(define (average-damp f)
  (define (average a b) (/ (+ a b) 2.0))
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2) (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (repeated f n)
  (define (compose f g) (lambda (x) (f (g x))))
  (define (iter i)
    (if (= i 1)
        f
        (compose f (iter (- i 1)))))
  (iter n))

(define (sqrt x)
  (fixed-point ((repeated average-damp 2)
                (lambda (y)
                  (/ x (expt y 3))))
               1.0))

;; 값을 조정하면서 실험해본 결과...
;;
;; x^(1/n)	# of average
;; 2 ~ 3	1
;; 4 ~ 7	2
;; 8 ~ 15	3
;; 16 ~ 31	4
;; 32 ~ 63	5
;; 64 ~ 127	6
;; 128 ~ 255	7

(define (nth-root x nth)
  (fixed-point ((repeated average-damp (floor (log nth 2)))
                (lambda (y)
                  (/ x (expt y (- nth 1)))))
               1.0))
