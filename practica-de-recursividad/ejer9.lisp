(defun devolver-menor (lista)
    (if (null (cdr lista))
        (car lista)
        (let ((min-resto (devolver-menor (cdr lista))))
            (if (< (car lista) min-resto)
                (car lista)
                min-resto))))

(defun mostrar-resultado (lista)
    (format t "Lista: ~a, Resultado: ~a ~%" lista (devolver-menor lista)))

(mostrar-resultado '(1 2 3 2 -1 0 -2))