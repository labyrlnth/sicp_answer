#lang racket

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((eq? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (cons (car set1) (union-set (cdr set1) set2)))))

;test
(union-set '() '())
(union-set '(1) '()) 
(union-set '() '(2))
(union-set '(1) '(2))
(union-set '(1 2 3 4) '(1 2 3 5))