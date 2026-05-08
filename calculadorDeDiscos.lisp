(defun ingresar-peso ()
    (format t "Ingrese el peso en kg (sin contar barra / máquina): ")
    (finish-output)
    (let ((peso (read)))
        (if (and (numberp peso) (plusp peso))
            peso
            (progn 
                (format t "Error: el peso ingresado debe ser un número positivo.~%")
                (ingresar-peso)))))


(defparameter lista-discos '(20 15 10 7.5 5 2.5 1.25))

(defun calcular-discos (peso lista-discos)
    (if (null lista-discos)
        '()
        (if (>= peso (car lista-discos))
            (cons (car lista-discos) (calcular-discos (- peso (car lista-discos)) lista-discos))
            (calcular-discos peso (cdr lista-discos)))))

(defun contar-discos (lista)
    (if (null lista)
        '()
        (let* ((actual (car lista))
               (resto (cdr lista))
               (cantidad (contar-iguales actual resto)))
            (cons (list actual (+ 1 cantidad))
                  (contar-discos (drop-while actual resto))))))

(defun contar-iguales (elem lista)
    (if (or (null lista) (not (= elem (car lista))))
        0
        (+ 1 (contar-iguales elem (cdr lista)))))

(defun drop-while (elem lista)
    (if (or (null lista) (not (= elem (car lista))))
        lista
        (drop-while elem (cdr lista))))

(defun imprimir-discos (lista)
    (if (null lista)
        nil 
        (let ((resto (imprimir-discos(cdr lista)))
              (elem (car lista)))
            (progn
                (format t "  ~akg x ~a~%" (first elem) (second elem))
                resto))))

(defun mostrar-resultado ()
    (let* ((peso (ingresar-peso))
           (pesos-un-slot (contar-discos (calcular-discos peso lista-discos)))
           (pesos-dos-slots (contar-discos (calcular-discos (/ peso 2) lista-discos))))
        (format t "Peso ingresado: ~akg~%" peso)
        (format t "Discos para un slot:~%")
        (imprimir-discos pesos-un-slot)
        (format t "Discos para dos slots (por lado):~%")
        (imprimir-discos pesos-dos-slots)))

(mostrar-resultado)