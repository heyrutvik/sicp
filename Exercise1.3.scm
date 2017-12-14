#lang sicp

(define (sum-of-two-large-number a b c)
  (cond ((and (< a b) (< a c)) (+ b c))
        ((and (< b a) (< b c)) (+ a c))
        (else (+ a b))))

(sum-of-two-large-number 1 2 3)
(sum-of-two-large-number 2 3 1)
(sum-of-two-large-number 3 1 2)