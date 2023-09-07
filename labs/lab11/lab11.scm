(define (over-or-under num1 num2)
  (if (> num1 num2)
      1
      (if (< num1 num2)
        -1
        0))) ; if

(define (over-or-under num1 num2)
  (cond
    ((> num1 num2) 1)
    ((< num1 num2) -1)
    (else 0))) ; cond

(define (make-adder num)
  (lambda (inc) (+ num inc))) ; lambda

(define (make-adder num)
  (define (adder inc) (+ num inc))
  adder) ; define

(define (composed f g)
  (lambda (x) (f (g x))))

(define (repeat f n)
  (define (helper f n)
    (if (= n 1)
      f
      (composed f (helper f (- n 1)))))
  (lambda (x) ((helper f n) x)))

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b)
  (define max_v (max a b))
  (define min_v (min a b))
  (define r (modulo max_v min_v))
  (if (zero? r)
    min_v
    (gcd min_v r)))
