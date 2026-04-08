;; Actividad N° 3: 
;; Una partícula se mueve en un plano y sus posiciones se registran como ((x1 y1) (x2 y2) ... 
;; (xn yn)). 
;; • Definir una función que calcule la distancia euclidiana entre la primera y la segunda 
;; posición registrada:     

(defun distancia (x1 y1 x2 y2)
    (sqrt (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2) ))
)

; Esto lo hizo chati
(defun distancia-lista (lista)
  (let* ((p1 (first lista))
         (p2 (second lista)))
    (distancia (first p1) (second p1)
               (first p2) (second p2))))