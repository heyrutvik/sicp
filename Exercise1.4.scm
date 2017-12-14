#lang sicp

(define (a-plus-abs-b a b)
  ((if (> b a) + -) a b))

(a-plus-abs-b 1 2)
(a-plus-abs-b 2 1)