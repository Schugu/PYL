;; Actividad N° 4: 
;; Definir una función llamada mi-segundo, la que a partir de una lista y un átomo ingresados 
;; por el operador deberá devolver una nueva lista donde el átomo ocupará la primera posición 
;; de la lista. (Recuerde que las posiciones comienzan a contarse desde la 0)

(defun mi-segundo (lista atomo)
    (cons atomo lista))

(defun ingresar-datos () 
    (format t "Ingresar la lista: ")
    (finish-output)
    (let ((lista (read)))
        (format t "Ingrese el átomo: ")
        (finish-output)
        (let ((atomo (read)))
            (format t "Resultado: ~a~%" (mi-segundo lista atomo)))))

(ingresar-datos)