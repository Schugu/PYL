;; Actividad N° 11: 
;; Crear las siguientes funciones de rotación: 
(defparameter lista '(1 2 3 4))

(defun mostrar-lista (lista)
    (format t "Lista: ~a~%" lista))
;; a. Una función llamada derecha que rote a la DERECHA los elementos de una lista 
;; ingresada como parámetro haciendo que su primer elemento pase a ser el último. 
;; Por ejemplo: 
;; >> (rotar-derecha '(1 2 3 4)) ==> (2 3 4 1). 
(defun derecha (lista)
    (append (cdr lista) (list (car lista))))

(mostrar-lista lista)
(mostrar-lista (derecha lista))



;; b. una función llamada izquierda que rote a la IZQUIERDA los elementos de una lista 
;; ingresada como parámetro haciendo que el último elemento pase a ser el primero.  
;; Por ejemplo, 
;; >> (rotar-izquierda '(1 2 3 4)) ==> (4 1 2 3).
(defun izquierda (lista)
    (append (last lista) (butlast lista)))

(mostrar-lista lista)
(mostrar-lista (izquierda lista))