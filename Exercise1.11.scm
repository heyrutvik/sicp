#lang sicp
(define (rec-f n)
  (if (< n 3)
      n
      (+ (rec-f (- n 1)) (* 2 (rec-f (- n 2))) (* 3 (rec-f (- n 3))))))

(define (iter-f n)
  (define (iter count a b c)
    (cond ((< n 3) n)
          ((> count n) c)
          (else (iter (+ count 1) b c (+ c (* 2 b) (* 3 a))))
          ))
  (iter 3 0 1 2))


(iter-f 50)
(rec-f 50)