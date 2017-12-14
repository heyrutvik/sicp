#lang sicp

(define (inc n)
  (+ n 1))

(define zero
  (lambda (f)
    (lambda (x) x)))

(define (add-1 n)
  (lambda (f)
    (lambda (x) (f ((n f) x)))))

(define (plus m n)
  (lambda (f)
    (lambda (x) ((m f) ((n f) x)))))

(define (mul m n)
  (lambda (f)
    (lambda (x) ((m (n f)) x))))

(define one (add-1 zero))
(define two (plus one one))
(define three (plus two one))
(define four (mul two two))