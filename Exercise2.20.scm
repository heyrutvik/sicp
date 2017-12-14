#lang sicp

(define (same-parity x . l)
  (define (check list p)
    (if (null? list)
        nil
        (if (= (remainder (car list) 2) p)
            (cons (car list) (check (cdr list) p))
            (check (cdr list) p))))
  (check (cons x l) (remainder x 2)))

(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)
    
