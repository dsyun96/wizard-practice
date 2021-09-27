;; (빈 리스트가 아닌) 리스트를 인자로 받아, 그 리스트의 마지막 원소만으로
;; 이루어진 리스트를 내놓는 last-pair 프로시저를 정의하라.
;;
;; (last-pair (list 23 72 149 34))
;; (34)

(define (last-pair lst)
  (if (eq? (cdr lst) '())
      (list (car lst))
      (last-pair (cdr lst))))
