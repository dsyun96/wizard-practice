;; a. 아래처럼 a에서 b 사이에 있는 어떤 수열을 묶어 가는 개념, 곧 accumulate가
;; 있다고 할 때, sum과 연습문제 1.31에서 만든 product가 이 개념을 응용한
;; 보기 가운데 하나임을 밝혀라.
;;
;; (accumulate combiner null-value term a next b)
;;
;; accumulate는 이어지는 두 값을 묶는 프로시저 combiner와, 계산할 값이 없을 때
;; 쓰는 null-value 인자를 받는다. 나머지 인자는 sum이나 product에서
;; 쓰는 인자(term, a, next, b)와 같다. accumulate를 만든 다음에 sum과 product를
;; accumulate를 불러 쓰는 프로시저로 짜 보라.

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (define (add x y) (+ x y))
  (accumulate add 0 term a next b))

(define (product term a next b)
  (define (mul x y) (* x y))
  (accumulate mul 1 term a inc b))

(define (square x) (* x x))
(define (identity x) x)
(define (inc x) (+ x 1))

(sum square 1 inc 10)        ; output - 385
(product identity 1 inc 10)  ; output - 3628800



;; b. accumulate의 프로세스가 되돈다면 반복하도록 고쳐 쓰고,
;; 그 반대로 반복한다면 되돌도록 고쳐 보라.

(define (accumulate combiner null-value term a next b)
  (define (iter now result)
    (if (> now b)
        result
        (iter (next now) (combiner result (term now)))))
  (iter a null-value))
