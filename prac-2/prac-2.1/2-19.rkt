;; 1.2.2절의 동전 바꾸기 프로그램을 살펴보자. 정해진 돈을 동전으로 바꾸는
;; 방법이 몇 가지나 되는지 알아봤는데, 이때 어떤 화폐로 쓸지 바꿔 끼울 수
;; 있도록 프로그램을 짜두면 좋다. 앞서 만든 프로그램에서는, 어떤 화폐를
;; 쓰느냐는 first-denomination에서 결정하고, 동전 바꾸는 방법은 count-change
;; 프로시저로 나누어 짰다(미국 동전은 다섯 가지라서 이 프로시저에는 5라는
;; 값이 들어가 있다.). 여기에 화폐를 바꿔 끼울 수 있으려면 동전 리스트를
;; 인자 값으로 건넬 수 있어야 한다.
;; 아울러, 두 번째 인자에 어떤 동전을 쓸지 나타내는 정수값 말고, 동전 값어치의
;; 리스트를 받을 수 있게끔, cc 프로시저를 다시 정의하려 한다. 이때, 어느 나라
;; 화폐인지에 따라 동전 리스트를 정의하면 다음과 같다.
;;
;; (define us-coins (list 50 25 10 5 1))
;;
;; (define uk-coins (list 100 50 20 10 5 2 1 0.5))
;;
;; 이렇게 고쳤을 때, cc 프로시저의 결과는 다음과 같다.
;;
;; (cc 100 us-coins)
;; 292
;;
;; 이런 결과가 나오도록 cc 프로시저를 좀 고쳐 써야 한다. 앞에서 만들어 본
;; cc 프로시저의 구조는 가만히 두고, 두 번째 인자를 고쳐 써 보면 다음과 같다.
;;
;; (define (cc amount coin-values)
;;   (cond ((= amount 0) 1)
;;         ((or (< amount 0) (no-more? coin-values)) 0)
;;         (else
;;           (+ (cc amount
;;                  (except-first-denomination coin-values))
;;              (cc (- amount
;;                     (first-denomination coin-values))
;;                  coin-values)))))
;;
;; 리스트 구조를 다루는 기본 연산으로 first-denomination, except-first-
;; denomination, no-more? 프로시저를 정의하라. coin-values 리스트 원소들의
;; 차례가 cc 프로시저의 결과에 영향을 주는가? 그렇다면 그 까닭은 무엇인가?
;; 또는 그렇지 않다면 그 까닭은 무엇인가?

(define (no-more? lst)
  (null? lst))

(define (first-denomination lst)
  (car lst))

(define (except-first-denomination lst)
  (cdr lst))

;; 영향을 주지 않는다.
;; 간단하게 순서를 바꿔서 실험해봐도 알 수 있지만,
;; cc 프로시저는 코인의 모든 가능한 조합의 수를 구하기 때문.
