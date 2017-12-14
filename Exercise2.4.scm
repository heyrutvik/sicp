#lang sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car p)
  (p (lambda (p q) p)))

(define (cdr p)
  (p (lambda (p q) q)))