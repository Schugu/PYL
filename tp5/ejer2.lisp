;; Actividad Nº 2: 
;; Definir una función; la que a partir de una lista ingresada por el operador; devuelva una 
;; nueva lista cuyos elementos sean el resultado de evaluar si cada elemento de la lista 
;; original es o no un elemento numérico

(defun ingresar-lista ()
    (format t "Ingrese el elemento: ")
    (finish-output)
    (let ((elem (read)))
        (format t "Desea ingresar un nuevo elemento? (1-Si / 2-No): ")
        (finish-output)
        (if (= (read) 1)
            (cons elem (ingresar-lista))
            (list elem))))

(defun es-num (lista)
    (mapcar #'numberp lista))

(defun mostrar-resultado ()
    (let ((lista (ingresar-lista)))
        (format t "Lista: ~%")
        (print lista)
        (format t "¿Es número?")
        (print (es-num lista))))

(mostrar-resultado)