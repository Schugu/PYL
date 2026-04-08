;; Actividad N° 5: 
;; Los días del mes de Enero y su temperatura promedio para cada uno de los días se 
;; almacenan en 
;; dos listas diferentes, cada una almacenada en su respectiva variable. Ellas son: 
;; • días_enero: contiene los números de los días en el mes de Enero ( 1 2 3 4....) 
;; • temp_promedio: contiene la temperatura promedio de cada día ( 37 35 37 ...) 
;; NOTA: Leer con atención el apunte funciones constructoras de listas y luego desarrollar las funciones 
;; necesarias para poder resolver los siguientes ítems. 
(defparameter dias_enero '(1 2 3 4 5 6 7 8 8 9 10))

(defparameter temp_promedio '(35 37 35 36 36 32 30 29 32 33))

;; a. Informar en una lista el primer día del mes junto con su temperatura promedio. 
(defun informar-primer-dia (mes temps)
    (format t "Primer día del mes.~%")
    (format t "Temperatura promédio: ~a °C.~%" (car temps)))

;; (informar-primer-dia dias_enero temp_promedio)


;; b. Informar en una lista el último día del mes junto con su temperatura promedio. 
(defun informar-ultimo-dia (mes temps)
    (format t "Último día del mes (~a).~%" (car (last mes)))
    (format t "Temperatura promédio: ~a °C.~%" (car (last temps))))

;; (informar-ultimo-dia dias_enero temp_promedio)


;; c.  Devolver una nueva lista con todos los elementos de las dos listas. Los 
;; mismos deben quedar todos en el primer nivel. 
(defun devolver-lista-primer-nivel (lista1 lista2)
  (format t "~a~%" (append lista1 lista2)))

;; (devolver-lista-primer-nivel dias_enero temp_promedio)


;; d. Devolver una nueva lista donde el primer elemento será la lista días_enero y 
;; el segundo elemento será la lista temp_promedio. 
(defun devolver-lista-segundo-nivel (lista1 lista2)
  (format t "~a~%" (list lista1 lista2)))

;; (devolver-lista-segundo-nivel dias_enero temp_promedio)


;; e. Devolver una nueva lista con todos los elementos de las dos listas. Los 
;; mismos deben quedar todos en el primer nivel. (Creo que se confundieron y como son las mismas)
;; la hago de segundo nivel
(defun devolver-lista-segundo-nivel-e (lista1 lista2)
  (format t "~a~%" (list lista1 lista2)))

;; (devolver-lista-segundo-nivel-e dias_enero temp_promedio)


;; f. Informar en una lista todas las temperaturas promedios menos la primera y la última.
(defun devolver-lista-sin-primero-ni-ultimo (lista)
    (format t "~a~%" (cdr (butlast lista))))

(devolver-lista-sin-primero-ni-ultimo temp_promedio)


