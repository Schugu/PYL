;; Actividad N° 13: 
;; Se registran los valores del nivel del rio, cada una en una variable diferente, las que son 
;; ingresadas por el operador.
;; Desarrollar las funciones necesarias para obtener 
;; a. La dispersión del nivel del rio. Siendo la dispersión, la diferencia entre el valor más 
;; alto y el más bajo. Estos valores deben ser ingresados.  
;; b. Determinar si esta dispersión corresponde a días parejos, locos o normales. 
;; ● Parejos si la dispersión es chica (menos de 30 cm) 
;; ● Locos si la dispersión es grande (más de un metro) 
;; ● Normales si no son ni parejos ni locos.

(defun calcular-dispercion (max min)
    (- max min))

(defun determinar-dispercion (valor)
    (cond 
        ((< valor 30) 'PAREJOS)
        ((and (>= valor 30) (<= valor 100)) 'NORMALES)
        ((> valor 100) 'LOCOS)))

(defun ingresar-datos ()
  (format t "Porfavor ingrese valor más alto en cm: ")
  (finish-output)
  (let ((max (read)))
    
    (format t "Porfavor ingrese el valor más bajo en cm: ")
    (finish-output)
    (let ((min (read)))
      
      (list max min))))  

(defun mostrar-resultado ()
  (let ((datos (ingresar-datos)))
    (let ((valor (calcular-dispercion (car datos) (cadr datos))))
      
      (format t "La disperción es de: ~acm.~%" valor)
      (format t "La disperción corresponde a días: ~a.~%" (determinar-dispercion valor)))))

(mostrar-resultado)

