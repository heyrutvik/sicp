#lang sicp

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (sqrt x)
  (define (sqrt-iter guess)
    (new-if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.0001))
  (define (improve guess)
    (average guess (/ x guess)))
  (sqrt-iter 1.0))

(sqrt 2)