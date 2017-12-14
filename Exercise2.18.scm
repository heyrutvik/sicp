#lang sicp

(define (reverse list)
  (define (reverse-iter list acc)
    (if (null? list)
        acc
        (reverse-iter (cdr list) (cons (car list) acc))))
  (reverse-iter list nil))

(reverse (list 1 4 9 16 25))
