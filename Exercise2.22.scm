#lang sicp

(define (square x) (* x x))

(define (wrong-square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) (cons answer (square (car things))))))
  (iter items nil))

(wrong-square-list (list 1 2 3 4))