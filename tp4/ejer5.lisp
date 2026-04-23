;; Las máximas temperaturas del mes de enero se registraron en una lista contenida en la 
;; variable max_enero. Definir una función que permita el ingreso por teclado de dicha lista y 
;; pueda resolver cada una de las siguientes situaciones.  
;; • Se desea conocer la cantidad de días que se registró una temperatura menor a los 38°. 
;; • Se desea conocer el valor de la temperatura promedio de dicho mes. Definir una 
;; función que reciba como parámetro la lista y devuelva el valor deseado. 
;; • Se desea saber si las temperaturas registradas en la lista están ordenadas en forma 
;; ascendente (para ello definir una función predicado que verifique lo solicitado) 
;; • Se desea conocer cuales son las diferentes temperaturas registradas. Para ello defina 
;; una función que devuelva una lista sin las temperaturas repetidas de la lista original. Si 
;; el elemento está repetido debe aparecer una sola vez

(defparameter total-casos 5)

(defun ingresar-datos ()
    (let ((lista '()))
        (format t "Ingrese 5 numeros:~%")
        (loop for i from 1 to total-casos do
            (format t "Numero ~a: " i)
            (finish-output)
            (push (read) lista))
        (reverse lista)))

;; a)
(defun contar-temps-menor (num lista)
    (if (null lista)
        0
        (let ((resto (contar-temps-menor num (cdr lista))))
            (if (< (first lista) num)
                (+ 1 resto)
                resto))))

;; b)
(defun sumar-temps (lista)
    (if (null lista)
        0
        (+ (first lista) (sumar-temps (cdr lista)))))

(defun calcular-promedio (lista)
    (if (null lista)
        0
        (/ (sumar-temps lista) (length lista))))

;; c)
(defun esta-ordenada-asc (lista)
  (or (null lista)
      (null (cdr lista))
      (and (<= (first lista) (second lista))
           (esta-ordenada-asc (cdr lista)))))

;; d)
(defun mostrar-dif-temps (lista)
    (if (null lista)
        '()
        (let* ((elem (car lista))
                (resto (mostrar-dif-temps (cdr lista))))
            (if (not (member elem resto)) 
                (cons elem resto)
                resto)))) 

(defun mostrar-resultado ()
  (let ((lista (ingresar-datos)))
    (format t "Lista: ~a~%" lista)
    (format t "Días registrados con temperatura menor a 38 °C: ~a~%"
            (contar-temps-menor 38 lista))
    (format t "Temperatura promedio de enero: ~a °C~%" (calcular-promedio lista))
    (format t "¿La lista está ordenada ascendentemente?: ~a~%" 
        (if (esta-ordenada-asc lista) "Si" "No"))
    (format t "Temperaturas registradas (sin repetidas): ~a~%" (mostrar-dif-temps lista))))

(mostrar-resultado)