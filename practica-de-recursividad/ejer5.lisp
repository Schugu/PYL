(defun devolver-pares (lista)
    (if (null lista)
        '()
        (if (evenp (car lista))
            (cons (car lista) (devolver-pares (cdr lista)))
            (devolver-pares (cdr lista)))))

(defun mostrar-resultado (lista)
    (format t "Lista: ~a, Pares: ~a ~%" lista (devolver-pares lista)))

(mostrar-resultado '(1 2 3 4 5 6 7 8))