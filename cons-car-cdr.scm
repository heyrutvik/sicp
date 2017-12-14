#lang sicp

(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (display (error "Argument not 0 or 1 -- CONS") m))))
  dispatch)

(define (car pair) (pair 0))

(define (cdr pair) (pair 1))
