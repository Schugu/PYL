;; Actividad complementaria N° 1:  
;; Escribe la expresión equivalente en LISP para las siguientes fórmulas matemáticas: 
;; 1. 5+(3×4)5+(3×4) 
;; 2. (10−2)/(3+1)(10−2)/(3+1) 
;; 3.   
;; �
;; �2 + 2𝑥 + 1 𝑥
;; 4.  𝑎 +𝑏
;; 𝑐 − 𝑑
;; 5.   𝑏 𝑥 ℎ
;; 2
;; 6.    𝑎2+𝑏

(defun operacion1 ()
    (+ 5 (* 3 4 5) (* 3 4)))

(defun operacion2 ()
    (/ (* (/ (- 10 2) (+ 3 1)) (- 10 2) ) (+ 3 1)))

(defun operacion3 (x)
    (+ (expt x 2) (* 2 x) (* 1 x)))

(defun operacion4 (a b c d)
    (/ (+ a b) (- c d)))

(defun operacion5 (b h)
    (/ (* b h) 2))

(defun operacion6 (a b)
    (sqrt (+ (expt a 2) (expt b 2)))
)

(defun mostrar-resultados ()
    (format t "Operación 1: ~a~%" (operacion1))
    (format t "Operación 2: ~a~%" (operacion2))
    (format t "Operación 3: ~a~%" (operacion3 1))
    (format t "Operación 4: ~a~%" (operacion4 1 1 4 2))
    (format t "Operación 5: ~a~%" (operacion5 2 1))
    (format t "Operación 6: ~a~%" (operacion6 2 2)))

(mostrar-resultados)