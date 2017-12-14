#lang sicp

(define (println s)
  (newline)
  (display s)
  (newline))

;; 2.27
(println ";; 2.27")
(define x (list (list 1 2) (list 3 4)))

(define (reverse list)
  (define (rev-iter items acc)
    (if (null? items)
        acc
        (rev-iter (cdr items) (cons (car items) acc))))
  (rev-iter list nil))

(reverse x)

(define (deep-reverse list)
  (define (rev-iter items acc)
    (cond ((null? items) acc)
          ((not (pair? items)) items)
          (else (rev-iter (cdr items) (cons (deep-reverse (car items)) acc)))))
  (rev-iter list nil))

(deep-reverse x)
