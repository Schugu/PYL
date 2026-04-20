;; A partir de una lista con las Notas de los parciales de un alumno, que es ingresada por el
;; operador, definir una función predicado llamada Aprobado. La función debe evaluar si la
;; materia está aprobada. Una materia está aprobada si todas las notas son 4 o valores mayores
;; a 4

(defparameter max-notas 4)

(defun ingresar-notas ()
    (let ((lista '()))
    (format t "Ingrese las notas: ~%")
        (loop for i from 0 below max-notas do
            (format t "Nota ~a: " (+ i 1))
            (finish-output)
            (push (read) lista))
        (reverse lista)))

(defun esta-aprobado (nota lista)
    (or (null lista)
        (and (>= (car lista) nota)
            (esta-aprobado nota (cdr lista)))))

(defun mostrar-resultados ()
    (let ((lista (ingresar-notas)))
        (format t "Lista de notas: ~a~%" lista)
        (format t "Esta aprobado?: ~a~%" 
        (if (esta-aprobado 4 lista) "Si" "No"))))

(mostrar-resultados)