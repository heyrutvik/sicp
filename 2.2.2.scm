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

;; 2.28
(println ";; 2.28")

(define (fringe x)
  (cond ((null? x) nil)
        ((not (pair? x)) (cons x nil))
        (else (append (fringe (car x)) (fringe (cdr x))))))

(fringe x)

(fringe (list x x))

;; 2.30 and 2.31
(println ";; 2.30 and 2.31")

(define (tree-map f tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (f tree))
        (else (cons (tree-map f (car tree)) (tree-map f (cdr tree))))))

(tree-map (lambda (x) (* x x)) x)
(define y (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(tree-map (lambda (x) (* x x)) y)

;; 2.32
(println ";; 2.32")

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(subsets (list 1 2))