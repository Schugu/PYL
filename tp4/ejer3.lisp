;; Actividad Nº 4 
;; A partir de dos listas ingresadas como parámetros, definir una función que devuelva una nueva 
;; lista donde cada elemento sea el resultado de la diferencia de los elementos de la lista 1 con 
;; los elementos de la lista 2 que se encuentren en la misma posición  

(defun diferenciar-listas (lista1 lista2)
    (if (or (null lista1) (null lista2))
        '()
        (let ((resto (diferenciar-listas (cdr lista1) (cdr lista2))))
            (cons (- (first lista1) (first lista2)) resto))))

(defun mostrar-resultados (lista1 lista2)
    (format t "Lista 1: ~a~%" lista1)
    (format t "Lista 2: ~a~%" lista2)
    (format t "Resultado: ~a~%" (diferenciar-listas lista1 lista2)))

(mostrar-resultados '(1 2 3 4) '(1 2 3 4))