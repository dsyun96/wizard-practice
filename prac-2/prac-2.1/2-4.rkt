;; 아래는 프로시저로 쌍을 표현하는 다른 방법이다. 이런 표현 방법으로, 어떤
;; 물체 x와 y가 있을 때 (car (cons x y))한 값이 x임을 밝혀 보라.
;;
;; (define (cons x y)
;;   (lambda (m) (m x y)))
;;
;; (define (car z)
;;   (z (lambda (p q) p)))
;;
;; 여기서 cdr를 어떻게 정의할 수 있는가? (귀띔: 이렇게 정의한 쌍이 올바로 돌아간
;; 다는 것을 따져보기 위해서, 1.1.5절의 맞바꿈 계산법을 써 보라.)

(car (cons x y))
;; -> ((cons x y) (lambda (p q) p))
;; -> ((lambda (p q) p) x y)
;; -> x

(define (cdr z)
  (z (lambda (p q) q)))
