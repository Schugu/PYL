;; Actividad complementaria N° 2:  
;; Sabiendo que LISP evaluará la expresión de ejemplo: (+ (* 2 3) (- 10 5))  
;; en el siguiente orden: 
;; 1. Primero se evalúa (* 2 3) → 6. 
;; 2. Luego (- 10 5) → 5. 
;; 3. Finalmente (+ 6 5) → 11. 

;; Determina el resultado numérico de las siguientes expresiones de LISP sin utilizar la 
;; computadora y haciendo la reducción paso por paso hasta llegar al resultado final:  

;; 1. (+ (* 2 3) (- 10 5)) 
;; Primero (* 2 3) -> 6
;; segundo (- 10 5) -> 5
;; Tercero (+ (* 2 3) (- 10 5)) -> (+ 6 5) -> 11
(defun operacion1 ()
  (+ (* 2 3) (- 10 5)))

;; 2. (/ (* 4 5) (+ 2 3)) 
;; Primero (* 4 5) -> 20
;; Segundo (+ 2 3) -> 5
;; Tercero (/ (* 4 5) (+ 2 3)) -> (/ 20 5) -> 4
(defun operacion2 ()
    (/ (* 4 5) (+ 2 3)))

;; 3. (- 100 (* 5 (+ 10 2))) 
;; Primero (+ 10 2) -> 12
;; Segundo (* 5 (+ 10 2)) -> (* 5 12) -> 60
;; Tercero (- 100 (* 5 (+ 10 2))) -> (- 100 (* 5 12)) -> (- 100 60) -> 40
(defun operacion3 ()
    (- 100 (* 5 (+ 10 2))))



(defun mostrar-resultados ()
    (format t "Operación 1: ~a~%" (operacion1))
    (format t "Operación 2: ~a~%" (operacion2))
    (format t "Operación 3: ~a~%" (operacion3)))

(mostrar-resultados)




