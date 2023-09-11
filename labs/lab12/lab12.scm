(define (substitute s old new)
  (if (null? s)
    nil
  (if (pair? (car s))
    (cons (substitute (car s) old new) (substitute (cdr s) old new))
    (if (eq? (car s) old)
      (cons new (substitute (cdr s) old new))
      (cons (car s) (substitute (cdr s) old new))))))

; Feel free to use these helper procedures in your solution
(define (map fn s)
  (if (null? s)
      nil
      (cons (fn (car s)) (map fn (cdr s)))))

(define (filter fn s)
  (cond 
    ((null? s)    nil)
    ((fn (car s)) (cons (car s) (filter fn (cdr s))))
    (else         (filter fn (cdr s)))))

(define (count x s)
  (if (null? s)
    0
    (if (equal? x (car s))
      (+ (count x (cdr s)) 1)
      (count x (cdr s)))))

(define (unique s)
  (if (null? s)
    nil
    (cons (car s) (unique (filter (lambda (x) (not (equal? x (car s)))) (cdr s))))))

(define (tally names)
  (map (lambda (x) (list x (count x names))) (unique names)))
