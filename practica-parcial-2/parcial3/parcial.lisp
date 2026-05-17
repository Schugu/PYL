(defun ingresar-posicion ()
    (format t "Posición de la onda: ~%")
    (format t "1 si la onda es superior al eje.~%")
    (format t "-1 si la onda es inferior al eje.~%")
    (format t "0 si la onda es sobre al eje.~%")
    (format t "Ingrese la posición: ")
    (finish-output)
    (let ((pos (read)))
        (if (and (numberp pos) (integerp pos) (>= pos -1) (<= pos 1))
            pos
            (progn
                (format t "Error: posición inválida.~%")
                (ingresar-posicion)))))


(defun ingresar-intensidad ()
    (format t "Ingrese la intensidad del eje: ")
    (finish-output)
    (let ((inten (read)))
        (if (numberp inten)
            inten
            (progn
                (format t "Error: intensidad inválida.~%")
                (ingresar-intensidad)))))

(defun ingresar-tipo ()
    (format t "Tipo de onda: ~%")
    (format t "A si es onda Alfa. ~%")
    (format t "B si es onda Beta. ~%")
    (format t "Ingrese el tipo de onda: ")
    (finish-output)
    (let ((tipo (read)))
        (if (or (eq tipo 'A) (eq tipo 'B))
            tipo
            (progn 
                (format t "Error: tipo inválido.~%")
                (ingresar-tipo)))))

(defun ingresar-lista ()
    (format t "Ingreso del elemento: ")
    (let ((elem 
            (list 
                (ingresar-posicion) (ingresar-intensidad) (ingresar-tipo))))
        (format t "¿Desea agregar otro elemento? (1-Si / 2-No): ")
        (finish-output)
        (let ((x (read)))
            (if (and (numberp x) (= x 1))
                (cons elem (ingresar-lista))
                (list elem)))))

(defun determianr-sublistas (lista)
    (if (null lista)
        T
        (let ((resto (determianr-sublistas  (cdr lista)))
              (elem (car lista)))
            (and (= (length elem) 3) resto))))
            
(defun contar-ondas-por-encima (lista)
    (if (null lista)
        0
        (let ((resto (contar-ondas-por-encima (cdr lista)))
              (elem (car lista)))
            (if (and (= (car elem) 1) (eq (third elem) 'A)) 
                (+ 1 resto)
                resto))))


(defun devolver-intensidades (lista)
    (mapcar #'second lista))

(defun devolver-ondas-alfa (lista)
    (if (null lista)
        '()
        (let ((elem (car lista)))
            (if (eq (caddr elem) 'A)
                (cons elem (devolver-ondas-alfa (cdr lista)))
                (devolver-ondas-alfa (cdr lista))))))

(defun devolver-result-ondas (lista)
    (mapcar (lambda (x) 
        (let ((onda (car x)))
            (cond
                ((= onda -1) "0000")
                ((= onda 1) "0011")
                (t "1001")))) 
        lista))

(defun mapear-pos (lista)
    (mapcar (lambda (x)
        (list 
            (cond
                ((= (car x) 1) "superior")
                ((= (car x) -1) "inferior")
                (t "sobre"))
            (cadr x) (caddr x))) lista))

(defun mostrar-resultado ()
    (let ((lista (ingresar-lista)))
        (format t "Lista: ")
        (print lista)
        
        (format t "~%¿Todos los elementos son sublistas de 3 elementos?: ~a~%"
            (if (determianr-sublistas lista) "Si" "No"))    

        (format t "Cantidad de elementos con ondas Alfa por encima del eje: ~a~%"
            (contar-ondas-por-encima lista))

        (format t "Intensidades de ejes: ~a~%" (devolver-intensidades lista))

        (format t "Elementos con ondas alfa: ~a~%" (devolver-ondas-alfa lista))

        (format t "Evalucaiones ondas: ~a~%" 
         (devolver-result-ondas (devolver-ondas-alfa lista)))

        (format t "Mapeo de posiciones de onda: ~a~%" (mapear-pos lista))))

(mostrar-resultado)