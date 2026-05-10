;; Actividad Nº 8: 
;; Definir la función sumo-ambos, la que a partir de 2 Listas no vacías: LISTA1 y LISTA2, 
;; devuelva una nueva Lista con el resultado de sumar elemento a elemento, los elementos de 
;; la misma posición. (1° elemento de LISTA1 con el 1° elemento de LISTA”, 2° elemento de 
;; LISTA1 con el 2° elemento de LISTA”, ….)

(defun sumar-listas (l1 l2)
    (mapcar #'+ l1 l2))

(print (sumar-listas '(1 2 3) '(1 2 3)))