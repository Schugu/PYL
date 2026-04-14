;; Actividad N° 2: Manejo de Listas 
;; Considerando que la lluvia caída en el mes de Enero se registra en una lista con sublistas, 
;; de dos elementos, con el siguiente formato:  
;; • primer elemento (día): número de día del mes en que cayó la lluvia 
;; • segundo elemento(lluvia caída): la cantidad en mm/h de lluvia caída ese día 
;; Desarrollar las funciones necesarias para obtener los siguientes datos: 
(defparameter lluvia_enero '((1 20) (2 0) (3 0) (4 50) (10 9.5)))

(defun imprimir-datos (sub-lista)
    (format t "Día ~a~%" (car sub-lista))
    (format t "Lluvia caída ~a mm/h~%" (cadr sub-lista))
)

;; a. ¿Cuál es el primer día que se informa la cantidad de lluvia caída? 
;; b. ¿Cuánto llovió el primer día que se informa? 
(defun informar-primer-dia (lista)
  (if (null lista)
      (format t "Error: la lista está vacía.~%")
      (if (null (car lista))
          (format t "Error: la sub-lista está vacía.~%")
          (imprimir-datos (car lista)))))

;; (informar-primer-dia lluvia_enero)

;; c. ¿Cuál es el último día que se informa la cantidad de lluvia caída? 
;; d. ¿Cuánto llovió el último día que se informa? 
(defun informar-ultimo-dia (lista)
  (if (null lista)
      (format t "Error: la lista está vacía.~%")
      (let ((ultimo (car (last lista))))
        (if (null ultimo)
            (format t "Error: la sub-lista está vacía.~%")
            (imprimir-datos ultimo)))))

;; (informar-ultimo-dia lluvia_enero)
    
;; e. Informar el día y la cantidad de lluvia caída el 4to día que se registra en la lista (devolver la sublista) 
;; f. Informar la cantidad de lluvia caída el 4to día que se registra en la lista. 
(defun informar-dia-especifico (dia lista)
  (if (null lista)
      (format t "Error: la lista está vacía.~%")
      (if (not (integerp dia))
          (format t "El número ingresado no es un entero.~%")
          (let ((especifico (nth (- dia 1) lista)))
            (if (null especifico)
                (format t "Error: índice fuera de rango.~%")
                (imprimir-datos especifico))))))

;; (informar-dia-especifico 4 lluvia_enero)

;; g. Evaluar si ( 10 9.5) se encuentra en la lista lluvia_enero
(defun evaluar-dia (dia lista)
  (if (null lista)
      (format t "Error: la lista está vacía.~%")
      (if (null dia)
          (format t "Error: el día ingresado está vacío.~%")
          (let ((encontrado (member dia lista :test #'equal)))
            (if encontrado
                (imprimir-datos (car encontrado))
                (format t "No se encontró el elemento.~%"))))))

;; (evaluar-dia '(10 9.5) lluvia_enero)