;; Actividad Nº 4: 
;; Realizar los cambios necesarios en la función definida en la Actividad N° 3, de tal manera que el 
;; resultado de cada evaluación realizada devuelva la leyenda SI o NO.  

(defparameter max-elem 5)

(defun ingresar-datos ()
    (format t "Ingrese los datos de la lista: ~%")
    (loop for i from 1 to max-elem do 
        (format t "Elemento ~a: " i)
        (finish-output)
        collect (read)))

(defun es-numerico (lista)
    (mapcar (lambda (x) (if (numberp x) 'SI 'NO)) lista))

(defun mostrar-resultados ()
    (let ((lista (ingresar-datos)))
        (format t "Lista: ~a~%" lista)
        (format t "¿Es numérico?: ~a~%" (es-numerico lista))))

(mostrar-resultados)