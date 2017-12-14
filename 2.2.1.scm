#lang sicp

(cons 1 (cons 2 (cons 3 (cons 4 nil))))

(define one-to-four (list 1 2 3 4))
(car one-to-four)
(cdr one-to-four)

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(list-ref one-to-four 2)

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(length one-to-four)

(define (length1 items)
  (define (length-iter items n)
    (if (null? items)
        n
        (length-iter (cdr items) (+ n 1))))
  (length-iter items 0))

(length1 one-to-four)

(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))

(append one-to-four one-to-four)

(define (scale-list items factor)
  (if (null? items)
      nil
      (cons (* (car items) factor) (scale-list (cdr items) factor))))

(scale-list one-to-four 10)

(define (map f items)
  (if (null? items)
      nil
      (cons (f (car items)) (map f (cdr items)))))

(map (lambda (x) (* x 10)) one-to-four)

(map (lambda (x) (/ x 2)) one-to-four)

(define (scale-list1 items factor)
  (map (lambda (x) (* x factor)) items))

(scale-list1 one-to-four 10)