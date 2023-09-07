(define (ascending? asc-lst)
    (if (or (null? asc-lst) (null? (cdr asc-lst)))
        #t
        (cond
            ((> (car asc-lst) (car (cdr asc-lst))) #f)
            (else (ascending? (cdr asc-lst)))
            )))

(define (my-filter pred s)
    (if (null? s)
        nil
        (if (pred (car s))
            (cons (car s) (my-filter pred (cdr s)))
            (my-filter pred (cdr s)))))

(define (interleave lst1 lst2)
    (define (helper lst1 lst2 who)
        (cond
            ((and (null? lst1) (null? lst2)) nil)
            ((null? lst1) (cons (car lst2) (helper nil (cdr lst2) 1)))
            ((null? lst2) (cons (car lst1) (helper (cdr lst1) nil 0)))
            (else (if (zero? who)
                    (cons (car lst1) (helper (cdr lst1) lst2 1))
                    (cons (car lst2) (helper lst1 (cdr lst2) 0))))))
    (helper lst1 lst2 0))

(define (no-repeats lst)
    (if (null? lst)
        nil
        (if (null? (cdr lst))
            (cons (car lst) nil)
            (cons (car lst) (no-repeats (cdr (cons (car lst) (my-filter (lambda (x) (not (= x (car lst)))) lst))))))))
