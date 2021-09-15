;; 1737년 스위스의 수학자 레온하르트 오일러(Leonhard Euler)가 『De Fractionibus
;; Continuis』라는 논문을 출판아였는데, 그 논문에서 e-2로 펼쳐지는 연속 분수가 나왔다.
;; 여기서 e는 자연로그의 밑수다. 이 분수에서 모든 Ni는 1이고, Di는 차례로 1, 2, 1, 1,
;; 4, 1, 1, 6, 1, 1, 8, ...가 된다. 이 방법에 바탕을 두고, 연습문제 1.37에서 작성한
;; cont-frac 프로시저를 사용하여 e를 추정하는 프로그램을 짜라.

(define (cont-frac n d k)
  (define (iter i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(+ 2
   (cont-frac (lambda (i) 1.0)
              (lambda (i)
                (if (= (remainder i 3) 2)
                    (* 2 (/ (+ i 1) 3))
                    1))
              21))

;; output:
;; 2.7182818284590455
