;; Ejercicio Nº 9: 
;; Definir la función ambos-enteros que solicite al operador el ingreso de dos Listas no vacías: 
;; LISTA1 y LISTA2. La función deberá devolver una nueva Lista con el resultado de evaluar 
;; elemento a elemento ambas Listas, indicando en forma de sublista ambos elementos, si 
;; coinciden en que sean números enteros.


(defun ingresar-lista ()
    (format t "Ingrese un elemento: ")
    (finish-output)
    (let ((elem (read)))
        (format t "¿Desea agreagar otro elemento?: (1-Si / 2-No): ")
        (finish-output)
        (if (= (read) 1)
            (cons elem (ingresar-lista))
            (list elem))))

(defun evaluar-enteros (l1 l2)
    (mapcar 
        (lambda (x y) 
            (list x y 
                (and (integerp x) (integerp y)))) 
        l1 l2))

(defun mostrar-resultado ()
    (format t "Lista 1: ~%")
    (let ((lista1 (ingresar-lista)))
        (format t "Lista 2: ~%")
        (let ((lista2 (ingresar-lista)))
            (format t "Lista 1: ")
            (print lista1)
            (format t "~%Lista 2: ")
            (print lista2)
            (format t "~%¿Son enteros?: ")
            (print (evaluar-enteros lista1 lista2)))))

(mostrar-resultado)