;; 인자 하나 받는 프로시저를 인자로 받아, 그 프로시저를 두 번 연거푸 계산하는
;; 프로시저를 내놓도록, 프로시저 double을 짜 보자. 예컨대 inc가 인자에 1을
;; 더하는 프로시저라면 (double inc)는 2를 더하는 프로시저가 된다. 다음 식의
;; 값은 얼마인가?
;;
;; (((double (double double)) inc) 5)

(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5)

;; (double double)
;; -> (lambda (x) (double (double x)))
;; -> g
;;
;; (double g)
;; -> (lambda (x) (g (g x)))
;; -> h
;;
;; ((h inc) 5)
;; -> ((g (g inc)) 5)
;; -> ((g (double (double inc))) 5)
;; -> ((double (double (double (double inc)))) 5)
;;
;; 따라서, inc를 2 * 2 * 2 * 2 = 16번 반복하여 최종 값은 21
