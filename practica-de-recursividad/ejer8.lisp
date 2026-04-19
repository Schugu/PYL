(defun devolver-mayor (lista)
    (if (null (cdr lista))
        (car lista)
        (let ((max-resto (devolver-mayor (cdr lista))))
            (if (> (car lista) max-resto)
                (car lista)
                max-resto))))

(defun mostrar-resultado (lista)
    (format t "Lista: ~a, Resultado: ~a ~%" lista (devolver-mayor lista)))

(mostrar-resultado '(1 2 3 2 -1 0 -2))