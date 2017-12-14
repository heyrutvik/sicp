#lang sicp

(define (half-interval-method f a b)
  (define average (lambda (a b) (/ (+ a b) 2.0)))
  (define close-enough? (lambda (x y) (< (abs (- x y)) 0.001)))
  (define search (lambda (neg-point pos-point)
    (let ((mid-point (average neg-point pos-point)))
      (if (close-enough? neg-point pos-point)
          mid-point
          (let ((test-value (f mid-point)))
            (cond ((positive? test-value) (search neg-point mid-point))
                  ((negative? test-value) (search mid-point pos-point))
                  (else mid-point)))))))
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value)) (search a b))
          ((and (negative? b-value) (positive? a-value)) (search b a))
          (else (error "Values are not of opposite sign" a b)))))

(half-interval-method sin 2.0 4.0)

(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0 2.0)