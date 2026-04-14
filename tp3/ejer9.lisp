;; Actividad N° 9: 
;; Definir una función predicado para cada una de los ítems que se detallan a continuación. 
;; Cada función definida debe recibir como parámetro la lista contenida en la variable 
;; max_temp. 

(defparameter max_temp '(30 15 20 25 30 35 40))

(defun esta-en-rango (r1 r2 temp)
  (and (>= temp r1) (<= temp r2)))

(defun pertenece-a-lista (lista temp)
    (position temp lista))

(defun son-iguales (elem1 elem2)
    (= elem1 elem2))

;; a. Evaluar si la temperatura registrada el primer día está comprendida entre los 40 y 45 
;; grados.  

(defun mostrar-resultado-rango (max_temp)
  (let ((temp (car max_temp)))
    (if (esta-en-rango 40 45 temp)
        (format t "La temperatura ~a está entre 40 y 45.~%" temp)
        (format t "La temperatura ~a no está entre 40 y 45.~%" temp))))

;; (mostrar-resultado-rango max_temp)


;; b. Evaluar si en alguno de los días del mes la máxima fue de 40. 
(defun mostrar-resultado-pertenece (lista temp) 
  (let ((resultado (position temp lista)))
    (if resultado
        (format t "El día ~a tuvo como temperatura máxima: ~a °C~%" (+ resultado 1) temp)
        (format t "Ningún día del mes tuvo la temperatura: ~a °C~%" temp))))

;; (mostrar-resultado-pertenece max_temp 40)


;; c. Evaluar si la temperatura del primer y último día son IGUALES.
(defun mostrar-resultado-iguales(lista)
    (if (son-iguales (car lista) (car (last lista)))
        (format t "La temperatura del primer y último día son iguales: ~a °C~%" (car lista))
        (format t "La temperatura del primer día (~a °C) y último día (~a °C) no son iguales.~%"
            (car lista) (car (last lista)))))

(mostrar-resultado-iguales max_temp)