;; Actividad Nº 3: 
;; Realizar los cambios necesarios en la función definida en la Actividad N° 3, de tal manera 
;; que el resultado de cada evaluación realizada devuelva la leyenda SI o NO.

(defun ingresar-lista ()
    (format t "Ingrese el elemento: ")
    (finish-output)
    (let ((elem (read)))
        (format t "¿Desea ingresar otro elemento? (1-Si / 2-No): ")
        (finish-output)
        (if (= (read) 1)
            (cons elem (ingresar-lista))
            (list elem))))

(defun imprimir-si-es-num (lista)
    (mapcar (lambda (x) 
        (if (numberp x) 'Si 'No
    )) lista))

(defun mostrar-resultado ()
    (let ((lista (ingresar-lista)))
        (format t "Lista:")
        (print lista)

        (format t "¿Es número?: ")
        (print (imprimir-si-es-num lista))))

(mostrar-resultado)