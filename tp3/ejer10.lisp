;; Actividad N° 10: 
;; Definir una función predicado, llamada dentro-de-rango-p que reciba tres números como 
;; argumentos: valor, mínimo y máximo. 
;; La función debe devolver T si el valor es mayor o igual al mínimo y menor o igual al máximo. 
;; De lo contrario, debe devolver NIL. 

(defun dentro-de-rango-p (val min max)
    (and (>= val min) (<= val max)))

(defun mostrar-resultado (val min max)
    (format t "Min: ~a, Max: ~a, Val: ~a, Dentro del rango: ~a.~%"
        min max val (if (dentro-de-rango-p val min max) "Si" "No" )))

(mostrar-resultado 15 10 20)