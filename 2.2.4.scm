#lang sicp
(#%require sicp-pict)

;; 2.44

(define (up-split1 painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split1 painter (- n 1))))
        (below painter (beside smaller smaller)))))

;; 2.45

(define (split f g)
  (define (splitter painter n)
    (if (= n 0)
        painter
        (let ((smaller (splitter painter (- n 1))))
          (f painter (g smaller smaller)))))
  splitter)

(define right-split2 (split beside below))
(define up-split2 (split below beside))

;; 2.46

(define (make-vect x y) (cons x y))
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

(define (add-vect v1 v2)
  (make-vect
   (+ (xcor-vect v1) (xcor-vect v2))
   (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect
   (- (xcor-vect v1) (xcor-vect v2))
   (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect v1 factor)
  (make-vect
   (* (xcor-vect v1) factor)
   (* (ycor-vect v1) factor)))

;; 2.47

(define origin (make-vect 0 0))
(define edge1 (make-vect 1 1))
(define edge2 (make-vect 5 5))

(define (make-frame-list origin edge1 edge2)
  (list origin edge1 edge2))

(define fl (make-frame-list origin edge1 edge2))

(define (origin-frame-list frame) (car frame))
(define (edge1-frame-list frame) (car (cdr frame)))
(define (edge2-frame-list frame) (car (cdr (cdr frame))))

(define (make-frame-cons origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define fc (make-frame-cons origin edge1 edge2))

(define (origin-frame-cons frame) (car frame))
(define (edge1-frame-cons frame) (car (cdr frame)))
(define (edge2-frame-cons frame) (cdr (cdr frame)))

;; 2.48

(define (make-segment v1 v2) (cons v1 v2))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))