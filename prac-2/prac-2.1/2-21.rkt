;; square-list 프로시저는 다음과 같이 수 리스트를 인자로 받아서 모든
;; 원소를 제곱한 다음 그 결과로 묶어서 리스트를 내놓는다.
;;
;; (square-list (list 1 2 3 4))
;; (1 4 9 16)
;;
;; square-list 프로시저를 정의하는 방법은 다음 두 가지다. 빈 곳을 채워
;; 프로시저를 완성하라.
;;
;; (define (square-list items)
;;   (if (null? items)
;;       nil
;;       (cons <??> <??>)))
;;
;; (define (square-list items)
;;   (map <??> <??>))

(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items)) (square-list (cdr items))))

(define (square-list items)
  (map (lambda (x) (* x x)) items))
