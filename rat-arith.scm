#lang sicp

(define (make-rat x y)
  (define (gcd x y)
  (if (= y 0)
      x
      (gcd y (remainder x y))))
  (let ((g (gcd (abs x) (abs y))))
    (let ((n (/ x g))
          (d (/ y g)))
      (cond ((and (< n 0) (< d 0)) (cons (abs n) (abs d)))
            ((and (< d 0) (cons (- n) (abs d))))
            (else (cons n d))))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (denom x) (numer y)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (denom x) (numer y)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define one-half (make-rat 1 2))
(print-rat one-half)
(print-rat (add-rat one-half one-half))
(print-rat (make-rat 11 4))
(print-rat (make-rat 11 -4))
(print-rat (make-rat -11 4))
(print-rat (make-rat -11 -4))
(print-rat (add-rat (make-rat -10 -4) (make-rat 11 -4)))