;; Louis Reasoner는 연습문제 2.21에서 만든 square-list 프로시저가 반복
;; 프로세스를 펼쳐낼 수 있도록 고쳐 쓰려고 한다.
;;
;; (define (square-list items)
;;   (define (iter things answer)
;;     (if (null? things)
;;         answer
;;         (iter (cdr things)
;;               (cons (square (car things))
;;                     answer))))
;;   (iter items nil))
;;
;; 한데, 위에 나온 대로 square-list 프로시저를 정의해 보면, 원소 차례가
;; 거꾸로 나온다. 왜 차례가 뒤집히는지 설명하라.
;; Louis는 cons에서 두 인자의 순서를 맞바꾸는 방법으로 이 오류를 풀어보
;; 려고 하였다.
;;
;; (define (square-list items)
;;   (define (iter things answer)
;;     (if (null? things)
;;         answer
;;         (iter (cdr things)
;;               (cons answer
;;                     (square (car things))))))
;;   (iter items nil))
;;
;; 허나, 이리 해보아도 제대로 된 결과가 나오지 않는다. 왜 그런가?

;; answer의 앞에 원소를 붙이고 있으므로 차례가 뒤집힌다.
;; 두 번째 경우, nil로 끝나는 answer를 cons의 첫 번째 인자로,
;; 단일 원소를 두 번째 인자로 넘겨주고 있으므로 우리가 원하는
;; 리스트의 형태가 아니게 된다.
