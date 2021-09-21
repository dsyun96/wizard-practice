;; 구간 값의 폭(width)이란, 구간의 상한에서 하한을 빼고서 반으로 나눈 값을 말한다.
;; 폭은 구간 값이 정확하지 않은 정도를 나타낸다. 구간 값의 산술 연산에서는 인자가
;; 되는 두 구간 값의 폭만 가지고, 결과 값의 폭을 구할 수 있는 연산도 있으나, 그렇지
;; 않은 연산도 있다. 두 구간 값을 더해서(또는 빼서)나온 구간 값의 폭은, 더하고 있는
;; (또는 빼고 있는) 구간 값의 폭으로도 구할 수 있다는 것을 밝혀라. 그리고 두 구간
;; 값을 곱하거나 나눠서 나온 구간 값의 폭은 그렇게 구하지 못한다는 것을 뒷받침하는
;; 보기를 찾아보아라.

;; 덧셈
;; z = x + y
;; z_lower = x_lower + y_lower
;; z_upper = x_upper + y_upper
;; z_width = (z_upper - z_lower) / 2
;;         = ((x_upper + y_upper) - (x_lower + y_lower)) / 2
;;         = x_width + y_width
;;
;; 뺄셈
;; z = x - y
;; z_lower = x_lower - y_upper
;; z_upper = x_upper - y_lower
;; z_width = (z_upper - z_lower) / 2
;;         = ((x_upper - y_lower) - (x_lower - y_upper)) / 2
;;         = x_width + y_width
;;
;; 곱셈
;; z = x * y
;; z_lower = min(x_lower * y_lower, x_lower * y_upper, x_upper * y_lower, x_upper * y_upper)
;; z_upper = max(x_lower * y_lower, x_lower * y_upper, x_upper * y_lower, x_upper * y_upper)
;; 구간의 상한, 하한 값에 따라 변하지 않는 x_width, y_width와 달리
;; z_lower, z_upper는 x, y 두 구간의 상한, 하한 값에 따라 달라지므로
;; x_width, y_width만으로 z_width를 계산할 수 없다.
;;
;; 나눗셈
;; 나눗셈은 역수의 곱셈으로 구하며, 곱셈의 경우 x_width, y_width로 z_width를 계산할 수
;; 없음을 보였으므로 나눗셈 역시 마찬가지로 계산할 수 없다.
