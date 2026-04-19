(defun devolver-mayores (num lista)
    (if (null lista)
        '()
        (if (> (car lista) num)
            (cons (car lista) (devolver-mayores num (cdr lista)))
            (devolver-mayores num (cdr lista)))))
            
(defun mostrar-resultado (num lista)
  (format t "Lista: ~a, Mayores a ~a: ~a ~%" 
          lista num (devolver-mayores num lista)))

(mostrar-resultado 2 '(1 2 3 4))