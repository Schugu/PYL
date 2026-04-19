(defun longitud (lista) 
    (if (null lista)
        0
        (+ 1 (longitud (cdr lista)))))

(defun mostrar-resultado (lista)
    (format t "Lista: ~a, Longitud: ~a ~%" lista (longitud lista)))

(mostrar-resultado '(1 2 3 4))