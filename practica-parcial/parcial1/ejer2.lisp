;;; ---------------------------------------------------------------------------
;;; EJERCICIO Nº 2
;;; ---------------------------------------------------------------------------

;;; Se necesita comprar arena y piedra para lo cual se posee un determinado 
;;; monto de dinero.

;;; a. Desarrollar una función que permita el ingreso por parte del operador 
;;;    del valor del m3 de arena, el valor del m3 de piedra y un determinado 
;;;    monto. La función también debe llamar a cada una de las funciones 
;;;    solicitadas en los puntos b, c y d.
(defun ingresar-arena ()
    (loop 
        (format t "Ingrese el valor por m³ de arena: ")
        (finish-output)
        (let ((x (read)))
            (if (plusp x)
                (return x)
                (format t "Error: debe ingresar un número positivo.")))))

(defun ingresar-piedra ()
    (loop 
        (format t "Ingrese el valor por m³ de piedra: ")
        (finish-output)
        (let ((x (read)))
            (if (plusp x)
                (return x)
                (format t "Error: debe ingresar un número positivo.")))))

(defun ingresar-monto ()
     (loop 
        (format t "Ingrese el monto: ")
        (finish-output)
        (let ((x (read)))
            (if (plusp x)
                (return x)
                (format t "Error: debe ingresar un número positivo.")))))


;;; b. Definir una función; la que a partir del dinero que se dispone para la 
;;;    compra y el valor de m3 de arena que serán ingresados como parámetros; 
;;;    devuelva el siguiente mensaje:
;;;    - "monto insuficiente", si el monto no le alcanza para comprar 1 m3 de arena.
;;;    - "monto justo", si el monto es igual a la compra de 2000 dm3 de arena, 
;;;      sabiendo que 1 m3 = 1000 dm3.
;;;    - "monto suficiente", si el monto ingresado supera a la mitad del valor 
;;;      del m3 de arena.
(defun me-alcanza (monto precio)
    (cond 
        ((< monto precio) 'INSUFICIENTE)
        ((= monto (* precio 2)) 'JUSTO)
        ((> monto (/ precio 2)) 'SUFICIENTE)
        (T               'NO-CUMPLE)))

(defun imprimir-mensajes (caso)
    (case caso
        (JUSTO "Monto justo")
        (SUFICIENTE "Monto suficiente")
        (INSUFICIENTE "Monto insuficiente")
        (NO-CUMPLE "No cumple las condiciones")))


;;; c. Definir una función predicado; la que a partir del dinero que se dispone 
;;;    para la compra, el valor de m3 de arena y el valor del m3 de piedra que 
;;;    serán ingresados como parámetros, evalúe si con la mitad del dinero 
;;;    disponible se puede comprar al menos 4 m3 de arena y 1,5 m3 de piedra.
(defun verificar-compra (monto precio-arena precio-piedra cant-arena cant-piedra)
    (>= monto
        (+ (* precio-arena cant-arena) 
           (* precio-piedra cant-piedra))))

(defun imprimir-mensaje-verif-compra (monto 
    precio-arena precio-piedra 
    cant-arena cant-piedra)

    (format t "¿Puedo comprar ~a m³ de arena y ~a m³ de piedra por ~a?: ~a~%"
        cant-arena cant-piedra monto
        (if (verificar-compra monto precio-arena 
        precio-piedra cant-arena cant-piedra)
            "Si" "No")))


;;; d. Definir una función; la que a partir del dinero que se dispone para la 
;;;    compra, el valor de m3 de arena y el valor del m3 de piedra que serán 
;;;    ingresados como parámetros, devuelva una lista formada por dos sublistas:
;;;    - La primera sublista contendrá el texto "arena", el monto ingresado 
;;;      como parámetro y la cantidad de m3 de arena que se puede comprar con ese monto.
;;;    - La segunda contendrá el texto "piedra", el monto ingresado como 
;;;      parámetro y la cantidad de m3 de piedra que se puede comprar con ese monto.
(defun cuanto-puedo-comprar (monto precio)
    (/ monto precio))

(defun posibles-compras (monto precio-arena precio-piedra)
  (list 
    (list 'Arena monto (cuanto-puedo-comprar monto precio-arena))
    (list 'Piedra monto (cuanto-puedo-comprar monto precio-piedra))))


;; Resultado
(defun mostrar-resultado ()
    (let ((arena (ingresar-arena))
          (piedra (ingresar-piedra))
          (monto (ingresar-monto)))

        (format t "Valor por M³ de arena: ~a~%" arena)
        (format t "Valor por M³ de piedra: ~a~%" piedra)
        (format t "Monto: ~a~%" monto)
        (format t "~a para comprar arena.~%" (imprimir-mensajes (me-alcanza monto arena)))
        (imprimir-mensaje-verif-compra (/ monto 2) arena piedra 4 1.5)
        (print (posibles-compras monto arena piedra))
    ))

(mostrar-resultado)