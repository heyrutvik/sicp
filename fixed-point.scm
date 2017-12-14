#lang sicp

(define (fixed-point f first-guess)
  (define close-enough? (lambda (x y) (< (abs (- x y)) 0.0001)))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (try next))))
  (try first-guess))

(fixed-point cos 1.0)

(define average (lambda (x y) (/ (+ x y) 2.0)))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(define (golden-ratio x)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1))

(sqrt 2)
(sqrt 4)

(golden-ratio 1)