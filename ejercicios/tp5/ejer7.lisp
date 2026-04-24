;; Actividad Nº 7 
;; Definir una función, la que a partir de una lista heterogénea  ingresada como parámetro, devuelva 
;; una nueva lista formada por las longitudes de aquellos elementos que sean sublistas.

(defparameter max-elem 5)

(defun ingresar-lista ()
    (format t "Ingrese los elementos de la lista: ~%")
    (loop for i from 1 to max-elem do
        (format t "Elemento ~a: " i)
        (finish-output)
        collect (read)))

(defun devolver-long (lista)
    (remove NIL
        (mapcar (lambda (x)
                    (if (listp x)
                        (length x)))
            lista)))

(defun mostrar-resultados()
    (let ((lista (ingresar-lista)))
        (format t "Lista:")
        (print lista)
        (format t "~%Longitudes:")
        (print (devolver-long lista))))

(mostrar-resultados)