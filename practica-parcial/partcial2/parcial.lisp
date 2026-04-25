;; SEGUNDO EXAMEN PARCIAL – PROGRAMACIÓN FUNCIONAL 
;; IMPORTANTE: Se descontarán puntos por: 
;; No utilización de variables locales cuando sea necesario. IF anidados con COND o viceversa. Falta 
;; de validación en los casos que sea necesario.  

;; En una única lista se tiene registrado el precio de las prendas de vestir de invierno. 
;; La información en la lista se presenta de la siguiente manera: 
;;                          ((prenda1 precio1) (prenda2 precio2) …) 
;; Donde prenda1, prenda2, … será el nombre de cada prenda y precio1, precio2, … será el precio 
;; que le corresponde a la prenda. Para la prenda no haya en stock, tendrá el valor 0 en precio. 

;; Ejercicio N° 1: 1.5 Ptos 
;; Desarrollar una función, la que permita que el operador ingrese la lista y llame a las distintas 
;; funciones que se solicitan. 
(defun agregar-prenda ()
    (format t "Ingrese el nombre de la prenda: ")
    (finish-output)
    (let ((nombre (read)))
        (format t "Ingrese el valor de la prenda: ")
        (finish-output)
        (let ((precio (read)))
            (list nombre precio))))

(defun agregar-prendas ()
  (let ((lista-prendas '()))
    (loop 
      (let ((nueva-prenda (agregar-prenda)))
        (push nueva-prenda lista-prendas)
        
        (format t "¿Desea agregar una nueva prenda? (1-SI / 2-NO): ")
        (finish-output)
        
        (when (= (read) 2)
          (return (nreverse lista-prendas))))))) 


;; Ejercicio N° 2: 2.5 Ptos 
;; Desarrollar una función, la que recibirá como parámetro la lista ingresada en el punto1; y permita 
;; obtener el promedio de los precios de las prendas de las que hay stock. 
(defun sumar-precios (lista)
    (if (null lista)
        0
        (+ (second (car lista)) (sumar-precios (cdr lista)))))

(defun contar-prendas-validas (lista)
    (if (null lista)
        0
        (let ((resto (contar-prendas-validas (cdr lista)))
               (precio (second (car lista))))
             (if (> precio 0)
                (+ 1 resto)
                resto))))

(defun calcular-promedio (lista)
    (let ((precio (sumar-precios lista))
          (cant (contar-prendas-validas lista)))
        (if (= cant 0)
            (format t "~%No se puede calcular el promedio porque no existe stock de prendas")
             (format t "~%Promedio de precios: $~,2f" 
                (float (/ precio cant))))))



;; Ejercicio N° 3: 2 Ptos 
;; Desarrollar una función; la que recibirá como parámetro la lista ingresada en el punto 1; la cual 
;; debe devolver una nueva lista formada solamente por los nombres de las prendas cuyo precio 
;; sea mayor a los 3000 pesos. 
(defun devolver-elementos-mayores (lista valor)
    (remove NIL
        (if (null lista)
        '()
        (let ((resto (devolver-elementos-mayores (cdr lista) valor))
              (elem (car lista)))
            (if (> (second elem) valor)
                (cons (car elem) resto)
                resto)))))

(defun imprimir-mensaje-elem-mayores (lista valor)
    (format t "~%Prendas con valor mayor de $~,2f" valor)
    (print (devolver-elementos-mayores lista valor)))


;; Ejercicio N° 4: 2.5 Ptos 
;; Desarrollar una función; utilizando mapcar, la que recibirá como parámetro la lista ingresada en 
;; el punto 1, la cual debe devolver una nueva lista conteniendo sublistas. Cada sublista estará 
;; formada por el precio de la prenda y un mensaje. 
;;  Para los precios de la lista iguales a 0, se formará una sublista conteniendo el precio y el 
;; mensaje "sin-stock". 
;;  Para los precios de la lista menores o iguales a 1000, se formará una sublista conteniendo 
;; el precio y el mensaje "barato". 
;;  Para los precios de la lista mayores a 1000, se formará una sublista conteniendo el precio 
;; y el mensaje "caro". 
(defun clasificar-por-precio (precio)
    (cond 
        ((= precio 0) "sin-stock")
        ((<= precio 1000) "barato")
        ((> precio 1000) "caro")
        (T "sin-clasificacion")))

(defun clasificar-prendas (lista)
    (mapcar (lambda (x) 
            (list (second x) (clasificar-por-precio (second x)))) 
        lista))


;; Ejercicio N° 5: 1.5 Ptos 
;; Definir una función utilizando mapcar, la que a partir de una lista ingresada como parámetro, 
;; devuelva una nueva lista cuyos elementos sean el resultado de evaluar uno a uno cada prenda, 
;; determinando si la misma posee o no stock. Recordar que una prenda no posee stock si su precio 
;; es 0.
(defun posee-stock (lista)
    (mapcar (lambda (x) (/= (second x) 0)) lista))


;; Resultado
(defun mostrar-resultado ()
    (let ((prendas (agregar-prendas)))
        (format t "Prendas:")
        (print prendas)
        (calcular-promedio prendas)
        (imprimir-mensaje-elem-mayores prendas 3000)
        (format t "~%Clasificación de prendas por precio: ")
        (print (clasificar-prendas prendas))
        (format t "~%¿Poseen stock?: ")
        (print (posee-stock prendas))))

(mostrar-resultado)