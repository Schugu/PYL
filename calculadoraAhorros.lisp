(defparameter periodos '(1 3 6 9 12 24 60))

(defun ingresar-sueldo ()
    (format t "Ingrese su sueldo: ")
    (finish-output)
    (let ((sueldo (read)))
        (if (and (numberp sueldo) (plusp sueldo))
            sueldo
            (progn 
                (format t "El sueldo ingresado no es válido.~%")
                (ingresar-sueldo)))))

(defun ingresar-porcentaje ()
    (format t "¿Que porcentaje del sueldo puede ahorrar? (1% - 100%): ")
    (finish-output)
    (let ((porcentaje (read)))
        (if (and (numberp porcentaje) (plusp porcentaje) (<= porcentaje 100))
            porcentaje
            (progn 
                (format t "Porcentaje inválido.~%")
                (ingresar-porcentaje)))))

(defun sacar-porcentaje (valor porcentaje)
    (/ (* valor porcentaje) 100))

(defun impimir-planes-ahorro (sueldo porcentaje periodos)
    (if (null periodos)
        nil
        (progn 
            (format t "~a Mes/es: $~,2f~%" 
                (car periodos)
                (* (sacar-porcentaje sueldo porcentaje) (car periodos)))
            (impimir-planes-ahorro sueldo porcentaje (cdr periodos)))))

(defun mostrar-resultado ()
    (let ((sueldo (ingresar-sueldo))
          (porcentaje (ingresar-porcentaje)))
        (format t "Sueldo: $~a~%" sueldo)
        (format t "Porcentaje de ahorro: ~a%~%" porcentaje)
        (format t "Porción del sueldo a ahorrar: $~a~%" (sacar-porcentaje sueldo porcentaje))
        (format t "===| Planes de ahorro |===~%")
        (impimir-planes-ahorro sueldo porcentaje periodos)))

(mostrar-resultado)