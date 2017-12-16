#lang sicp
(#%require sicp-pict)

;; (a)
(define border-segments
 (list
  (make-segment
   (make-vect 0.0 0.0)
   (make-vect 0.0 0.99))
  (make-segment
   (make-vect 0.0 0.0)
   (make-vect 0.99 0.0))
  (make-segment
   (make-vect 0.99 0.0)
   (make-vect 0.99 0.99))
  (make-segment
   (make-vect 0.0 0.99)
   (make-vect 0.99 0.99))))

(define border (segments->painter border-segments))
;(paint border)

;; (b)
(define cross-segments
  (list
   (make-segment
    (make-vect 0 0)
    (make-vect 1 1))
   (make-segment
    (make-vect 0 1)
    (make-vect 1 0))))

(define x (segments->painter cross-segments))
;(paint x)

;; (c)
(define star-segments
  (list
   (make-segment (make-vect 0.5 0) (make-vect 1 0.75))
   (make-segment (make-vect 0.5 0) (make-vect 0 0.75))
   (make-segment (make-vect 0 0.75) (make-vect 1 0.75))
   (make-segment (make-vect 0.5 1) (make-vect 0 0.25))
   (make-segment (make-vect 0.5 1) (make-vect 1 0.25))
   (make-segment (make-vect 0 0.25) (make-vect 1 0.25))))
(define star (segments->painter star-segments))
;(paint star)

;; (d)
(define wave-segments
 (list
  (make-segment
   (make-vect 0.006 0.840)
   (make-vect 0.155 0.591))
  (make-segment
   (make-vect 0.006 0.635)
   (make-vect 0.155 0.392))
  (make-segment
   (make-vect 0.304 0.646)
   (make-vect 0.155 0.591))
  (make-segment
   (make-vect 0.298 0.591)
   (make-vect 0.155 0.392))
  (make-segment
   (make-vect 0.304 0.646)
   (make-vect 0.403 0.646))
  (make-segment
   (make-vect 0.298 0.591)
   (make-vect 0.354 0.492))
  (make-segment
   (make-vect 0.403 0.646)
   (make-vect 0.348 0.845))
  (make-segment
   (make-vect 0.354 0.492)
   (make-vect 0.249 0.000))
  (make-segment
   (make-vect 0.403 0.000)
   (make-vect 0.502 0.293))
  (make-segment
   (make-vect 0.502 0.293)
   (make-vect 0.602 0.000))
  (make-segment
   (make-vect 0.348 0.845)
   (make-vect 0.403 0.999))
  (make-segment
   (make-vect 0.602 0.999)
   (make-vect 0.652 0.845))
  (make-segment
   (make-vect 0.652 0.845)
   (make-vect 0.602 0.646))
  (make-segment
   (make-vect 0.602 0.646)
   (make-vect 0.751 0.646))
  (make-segment
   (make-vect 0.751 0.646)
   (make-vect 0.999 0.343))
  (make-segment
   (make-vect 0.751 0.000)
   (make-vect 0.597 0.442))
  (make-segment
   (make-vect 0.597 0.442)
   (make-vect 0.999 0.144))))

(define wave (segments->painter wave-segments))
;(paint wave)


;; using 2.44 code
(define (up-split1 painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split1 painter (- n 1))))
        (below painter (beside smaller smaller)))))

(paint (up-split1 wave 2))