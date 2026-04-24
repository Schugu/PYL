;; Actividad Nº 2. 
;; Determinar el resultado que arrojarían las siguientes funciones lambda 

;; ((lambda (X) (if (> (car X) 0) 'POSITIVO)) '(5 6 7)) => ('POSITIVO)
;; (print ((lambda (X) (if (> (car X) 0) 'POSITIVO)) '(5 6 7)))
;; (print (mapcar (lambda (x) (if (> x 0) 'POSITIVO 'NEGATIVO)) '(-1 6 7)))

;; ((lambda (X) (if (> (car X) 0) 'POSITIVO)) '(-5 6 7)) => NIL
;; (print ((lambda (X) (if (> (car X) 0) 'POSITIVO)) '(-5 6 7))) 

;; ((lambda (A) (reverse (cdr A))) '((2 3 4) a b c))  => (c b a)
;; (print ((lambda (A) (reverse (cdr A))) '((2 3 4) a b c)))

;; ((lambda (X) (if (numberp (car X)) (* 2 (car X)))) '(5 6 7)) => 10
;; (print ((lambda (X) (if (numberp (car X)) (* 2 (car X)))) '(5 6 7)))

;; ((lambda (X) (if (and (numberp (car X)) (evenp (car X))) (+ 10 (car X)))) '(4 6 7)) => 14
;; (print ((lambda (X) (if (and (numberp (car X)) (evenp (car X))) (+ 10 (car X)))) '(4 6 7)))

;; ((lambda (X) (if (and (numberp (car X)) (evenp (car X))) (+ 10 (car X)) 0 )) '(7 6 7))  => 0
;; (print ((lambda (X) (if (and (numberp (car X)) (evenp (car X))) (+ 10 (car X)) 0 )) '(7 6 7)))