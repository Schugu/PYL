(defun sumar-pares-multiplicados (num lista)
    (if (null lista)
        0
        (if (evenp (car lista))
            (+ (* (car lista) num) (sumar-pares-multiplicados num (cdr lista)))
            (sumar-pares-multiplicados num (cdr lista)))))

(defun mostrar-resultado (num lista)
    (format t "Lista: ~a, Resultado: ~a ~%" lista (sumar-pares-multiplicados num lista)))

(mostrar-resultado 2 '(1 2 3 4))