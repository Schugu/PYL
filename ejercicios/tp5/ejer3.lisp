;; Actividad Nº 3. 
;; Definir una función; la que a partir de una lista ingresada por el operador; devuelva una nueva lista 
;; cuyos elementos sean el resultado de evaluar si cada elemento de la lista original es o no un 
;; elemento numérico 

(defparameter max-elem 5)

(defun ingresar-datos ()
    (format t "Ingrese los datos de la lista: ~%")
    (loop for i from 1 to max-elem do 
        (format t "Elemento ~a: " i)
        (finish-output)
        collect (read)))

(defun es-numerico (lista)
    (mapcar (lambda (x) (if (numberp x) 'NUMERICO 'NO-NUMERICO)) lista))

(defun mostrar-resultados ()
    (let ((lista (ingresar-datos)))
        (format t "Lista: ~a" lista)
        (print (es-numerico lista))))

(mostrar-resultados)