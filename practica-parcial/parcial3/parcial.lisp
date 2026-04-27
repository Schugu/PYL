;; En una única lista se tienen registrados los pesos expresados en Kg de determinadas cajas que 
;; deben ser transportadas. 
(defparameter pesos-cajas '(5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80))

;; Ejercicio N° 1: 1.5 Ptos 
;; Desarrollar una función predicado, la que a partir de la lista y una variable numérica (conteniendo 
;; un determinado peso) ingresadas ambas por el operador, permita determinar si todas las cajas 
;; tienen un peso mayor al peso ingresado por el operador. 
(defun determinar-mayores (lista num)
  (every (lambda (x) (> x num)) lista))

(defun ingresar-peso ()
    (format t "Ingrese el peso en kg: ")
    (finish-output)
    (let ((peso (read)))
        (if (and (numberp peso) (plusp peso))
            peso
            (progn 
                (format t "Debe ingresar un número positivo.~%")
                (ingresar-peso)))))

(defun mostrar-determinar-mayores (lista)
    (let ((peso (ingresar-peso)))
        (format t "¿Todos los paquetes pesan más que ~a?: ~a~%" peso
            (if (determinar-mayores lista peso) "Si" "No"))))


;; Ejercicio N° 2: 2.5 Ptos 
;; Desarrollar una función, la que a partir de la lista con los pesos expresados en Kg, la que será 
;; ingresada como parámetro, devuelva una nueva lista formada por dos sublistas. Donde: 
;; La primer sublista estara formada por los pesos mayores a 30. 
;; La segunda sublista estará formada solamente con los pesos que sean menores o iguales 
;; a 30. Estos pesos deberán ser expresadas en gramos. Recordar que 1kg = 1000 gramos. 
(defun devolver-menores (lista peso)
    (remove-if (lambda (x) (> x peso)) lista))

(defun devolver-mayores (lista peso)
    (remove-if-not (lambda (x) (> x peso)) lista))

(defun convertir-lista-kg-gr (lista)
    (mapcar (lambda (x) (* x 1000)) lista))

(defun separar-por-peso (lista peso)
  (list
    (devolver-mayores lista peso)
    (convertir-lista-kg-gr 
        (devolver-menores lista peso))))

(defun mostrar-separar-por-peso (lista peso)
    (let ((resultado (separar-por-peso lista peso)))
        (format t "Elementos separados por limite de peso (~a kg): ~&" peso)
        (format t "Elementos mayores a ~a kg:" peso)
        (print (car resultado))
        (format t "~%Elementos menores o iguales a ~a kg expresados en gramos:" peso)
        (print (cadr resultado))))


;; Ejercicio N° 3: 1.5 Ptos 
;; Desarrollar una función, la que a partir de la lista con los pesos y una variable numérica 
;; (conteniendo un determinado peso) ingresados como parámetros, permita determinar la 
;; cantidad de cajas que poseen un peso menor o igual al peso ingresado como parámetro. 
(defun mostrar-devolver-menores (lista peso)
    (format t "~%Cantidad de Paquetes con un peso menor o igual a ~a kg: ~a~%"
        peso (length (devolver-menores lista peso))))


;; Ejercicio N° 4: 1.5 Ptos 
;; Definir una función utilizando mapcar, la que a partir de una lista ingresada como parámetro y un 
;; valor atómico conteniendo un determinado peso, devuelva una nueva lista cuyos elementos sean 
;; el resultado de evaluar uno a uno si cada elemento de la lista original posee un peso mayor al 
;; peso ingresado por parámetro. 
(defun son-mayores (lista num)
    (mapcar (lambda (x) (> x num)) lista))

(defun mostrar-devolver-mayores (lista peso)
    (format t "¿Pesan mas que ~a kg?:" peso)
    (print (son-mayores lista peso)))


;; Ejercicio N° 5: 2 Ptos 
;; Desarrollar una función, utilizando mapcar, la que a partir de la lista con los diferentes pesos, la 
;; que será ingresada como parámetro, devuelva una nueva lista formada por sublistas. Cada 
;; sublista contendrá un peso y un mensaje. El mensaje será el siguiente: 
;;          Si el peso es <= 20, el mensaje será "liviano". 
;;          Si el peso es > 20 y <= 60, el mensaje será "pesado". 
;;          Si el peso es > 60, el mensaje será "muy pesado".
(defun clasificar-peso (peso)
    (cond 
        ((> peso 60) "muy pesado")
        ((> peso 20) "pesado")
        (t "liviano")))

(defun clasificar-lista-por-peso (lista)
    (mapcar (lambda (x) 
            (list x (clasificar-peso x))) 
        lista))

(defun mostrar-clasificacion-por-peso (lista)
    (format t "~%Paquetes clasificados por peso:")
    (print (clasificar-lista-por-peso lista)))


;; Resultado
(defun mostrar-resultados (lista)
    (mostrar-determinar-mayores lista)
    (mostrar-separar-por-peso lista 30)
    (mostrar-devolver-menores lista 30)
    (mostrar-devolver-mayores lista 30)
    (mostrar-clasificacion-por-peso lista))

(mostrar-resultados pesos-cajas)