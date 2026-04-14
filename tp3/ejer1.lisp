;; Actividad N° 1: 
;; Para desarrollar esta actividad puede ayudarse de las resoluciones de la Actividad 1 
;; a. A partir de un determinado monto en pesos, que será ingresado por operador, definir 
;; una función que devuelva la cantidad de dólares que se pueden comprar con el monto ingresado.  
(defun pesos-a-dolares (pesos)
  (/ pesos 1450.50))

(defun ingresar-pesos ()
  (format t "Ingrese la cantidad de pesos: ")
  (finish-output) ;; <- esto es la clave
  (let ((pesos (read)))
    (format t "Usted puede comprar ~,2f dolares.~%" 
            (pesos-a-dolares pesos))))

;; (ingresar-pesos)



;; b. Recordando la fórmula que permite calcular el volumen de un cilindro, definir una 
;; función que permita el ingreso por teclado de las variables necesarias para ejecutar 
;; dicha función y obtener el valor del volumen  
(defun calcular-volumen (radio altura)
    (* pi radio radio altura))

(defun ingresar-datos-cilindro ()
    (format t "Ingrese el radio: ")
    (finish-output)
    (let ((radio (read)))
        (format t "Ingrese la altura: ")
        (finish-output)
        (let ((altura (read)))
            (format t "El volúmen es: ~,2f ~%"(calcular-volumen radio altura)))))

;; (ingresar-datos-cilindro)



;; c. Recordando la fórmula que permite calcular el área del trapecio, definir una función 
;; que permita el ingreso por teclado de las variables necesarias para ejecutar dicha 
;; función y obtener el valor del área.
(defun calcular-area-trapecio (base-mayor base-menor altura)
  (/ (* (+ base-mayor base-menor) altura) 2.0))

(defun ingresar-datos-trapecio()
    (format t "Ingrese la base mayor: ")
    (finish-output)
    (let ((base-mayor (read)))
        (format t "Ingrese la base menor: ")
        (finish-output)
        (let ((base-menor (read)))
            (format t "Ingrese la altura: ")
            (finish-output)
            (let ((altura (read)))
                (format t "El área del trapecio es igual a: ~,2f ~%"
                    (calcular-area-trapecio base-mayor base-menor altura))))))

(ingresar-datos-trapecio)