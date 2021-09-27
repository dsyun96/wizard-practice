;; 리스트를 인자로 받아 그 원소들의 차례를 거꾸로 뒤집는 reverse 프로시저를
;; 정의하라.
;;
;; (reverse (list 1 4 9 16 25))
;; (25 16 9 4 1)

(define (reverse lst)
  (if (null? lst)
      null
      (append (reverse (cdr lst)) (list (car lst)))))
