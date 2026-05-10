;; Actividad Nº 6: 
;; Definir una función, la que a partir de una lista heterogénea ingresada como parámetro, 
;; devuelva una nueva lista formada por las longitudes de aquellos elementos que sean 
;; sublistas.

(defun ingresar-lista ()
    (format t "Ingresa un elemento: ")
    (finish-output)
    (let ((elem (read)))
        (format t "¿Desea ingresar otro elemento? (1-Si / 2-No): ")
        (finish-output)
        (if (= (read) 1)
            (cons elem (ingresar-lista))
            (list elem))))

(defun calcular-longitudes (lista)
    (remove NIL
        (mapcar 
            (lambda (x)
                (if (listp x) (length x))) 
            lista)))

(defun mostrar-resultado ()
    (let ((lista (ingresar-lista)))
        (format t "Lista:")
        (print lista)
        (format t "~%Longitudes de listas:")
        (print (calcular-longitudes lista))))

(mostrar-resultado)