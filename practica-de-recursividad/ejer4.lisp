(defun contar-pares (lista)
    (if (null lista)
        0
        (if (evenp (car lista))
            (+ 1 (contar-pares (cdr lista)))
            (contar-pares (cdr lista)))))

(defun mostrar-resultado (lista)
    (format t "Lista: ~a, Pares: ~a ~%" lista (contar-pares lista)))

(mostrar-resultado '(1 2 3 4 5 6))