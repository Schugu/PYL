(defun contar-mayores (num lista)
  (if (null lista)
      0
      (if (> (car lista) num)
          (+ 1 (contar-mayores num (cdr lista)))
          (contar-mayores num (cdr lista)))))

(defun mostrar-resultado (num lista)
  (format t "Lista: ~a, Mayores a ~a: ~a ~%" 
          lista num (contar-mayores num lista)))

(mostrar-resultado 2 '(1 2 3 4))