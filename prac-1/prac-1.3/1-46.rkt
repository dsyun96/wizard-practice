;; 이 장에서 설명한 여러 수 계산법은 반복하여 고치기(iterative improvement)라 하는
;; 더 일반적인 방법에 바탕을 둔다. 무엇을 반복해서 고친다는 말은 이런 뜻이다. 어떤
;; 값을 얻고자 할 때, 처음에 그 값을 어림잡은 어떤 값에서 시작하되 어떤 계산 과정을
;; 거쳐서 더 나은 어림값을 만든다. 꽤 쓸 만한 어림값이 나올 때까지 그 계산 과정을
;; 되풀이한다. 이런 일반적인 방법을 곧바로 나타내는 iteratvie-improve 프로시저를
;; 짜보자. 이 프로시저는 어림값이 충분히 괜찮은지 알아보는 방법과 더 좋은 어림값을
;; 계산하는 방법을 프로시저 인자로 받아서, 무언가를 반복하여 고치는 프로시저를
;; 결과 값으로 내놓는다. 1.1.7절의 sqrt 프로시저와 1.3.3절의 fixed-point 프로시저가
;; iterative-improve를 쓰도록 고쳐 보라.

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
          next
          (iter next))))
  (lambda (x) (iter x)))

(define (sqrt x)
  ((iterative-improve (lambda (guess next)
                        (< (abs (- (* guess guess) x)) 0.00001))
                      (lambda (y)
                        (/ (+ y (/ x y)) 2.0)))
   1.0))

(sqrt 3)

;; output:
;; 1.7320508075688772

(define (fixed-point f first-guess)
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) 0.00001))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough? improve) first-guess))

(define (sqrt-fixed-point x)
  (define (average-damp f)
    (lambda (x) (/ (+ x (f x)) 2.0)))
  (fixed-point
    (average-damp (lambda (y) (/ x y)))
    1.0))

(sqrt-fixed-point 3)

;; output:
;; 1.7320508075688772
