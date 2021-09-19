;; 양수뿐 아니라 음수까지 다룰 수 있는 make-rat을 정의하라. 새 make-rat은,
;; 유리수가 양수라면 분자와 분모 모두 양수이고, 유리수가 음수라면 분자만
;; 음수가 되도록 처리해야 한다.

(define (make-rat n d)
  (let ((g (gcd n d))
        (sign (if (> d 0) 1 -1)))
    (cons (* sign (/ n g))
          (* sign (/ d g)))))

(define (print-rat x)
  (display (car x))
  (display "/")
  (display (cdr x))
  (newline))

(print-rat (make-rat 6 10))
(print-rat (make-rat -6 10))
(print-rat (make-rat 6 -10))
(print-rat (make-rat -6 -10))

;; output:
;; 3/5
;; -3/5
;; -3/5
;; 3/5
