;; 연습문제 1.22에서 나온 기본 프로시저 newline과 display를 써서 이어지는
;; 어림값을 찍어내도록 fixed-point를 고쳐보라. 그리고 x ↦ log(1000)/log(x)
;; 의 고정점을 찾아서 x^x = 1000에 맞는 x 값을 얻어라.
;; (귀띔: Scheme의 기본 프로시저 log를 쓰면 자연 로그 값을 얻을 수 있다.)
;; 함수 값의 평균을 내어 잦아들 때와 그냥 놔둘 때 계산 단계를 얼마나 거치는지
;; 알아보라.
;; (귀띔: 이 문제에서 첫 어림값이 1이면 log(1) = 0을 분모로 하는 나눗셈이
;; 필요하므로 1은 첫 어림값이 되지 못한다.)

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display "now guess... ")
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)

;; 그냥 놔두는 경우 다음과 같은 단계를 거친다.
;; now guess... 2.0
;; now guess... 9.965784284662087
;; now guess... 3.004472209841214
;; now guess... 6.279195757507157
;; now guess... 3.759850702401539
;; now guess... 5.215843784925895
;; now guess... 4.182207192401397
;; now guess... 4.8277650983445906
;; now guess... 4.387593384662677
;; now guess... 4.671250085763899
;; now guess... 4.481403616895052
;; now guess... 4.6053657460929
;; now guess... 4.5230849678718865
;; now guess... 4.577114682047341
;; now guess... 4.541382480151454
;; now guess... 4.564903245230833
;; now guess... 4.549372679303342
;; now guess... 4.559606491913287
;; now guess... 4.552853875788271
;; now guess... 4.557305529748263
;; now guess... 4.554369064436181
;; now guess... 4.556305311532999
;; now guess... 4.555028263573554
;; now guess... 4.555870396702851
;; now guess... 4.555315001192079
;; now guess... 4.5556812635433275
;; now guess... 4.555439715736846
;; now guess... 4.555599009998291
;; now guess... 4.555493957531389
;; now guess... 4.555563237292884
;; now guess... 4.555517548417651
;; now guess... 4.555547679306398
;; now guess... 4.555527808516254
;; now guess... 4.555540912917957
;; 4.555532270803653



(define (average x y) (/ (+ x y) 2.0))

(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)

;; 평균을 내어 잦아드는 경우 다음과 같은 단계를 거친다.
;; 성능 확실한 것 같다.
;; now guess... 2.0
;; now guess... 5.9828921423310435
;; now guess... 4.922168721308343
;; now guess... 4.628224318195455
;; now guess... 4.568346513136242
;; now guess... 4.5577305909237005
;; now guess... 4.555909809045131
;; now guess... 4.555599411610624
;; now guess... 4.5555465521473675
;; 4.555537551999825
