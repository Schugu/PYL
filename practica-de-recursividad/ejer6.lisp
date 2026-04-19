(defun multiplicar-pares (num lista)
    (if (null lista)
        '()
        (if (evenp (car lista))
            (cons (* (car lista) num) (multiplicar-pares num (cdr lista)))
            (multiplicar-pares num (cdr lista)))))

(defun mostrar-resultado (num lista)
    (format t "Lista: ~a, Pares multiplicados: ~a ~%" lista (multiplicar-pares num lista)))

(mostrar-resultado 2 '(1 2 3 4 5 6 7 8))