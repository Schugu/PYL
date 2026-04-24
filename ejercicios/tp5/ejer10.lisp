;; Ejercicio Nº 10:  
;; Definir la función ambos-enteros  que solicite al operador el ingreso de dos Listas no vacías: 
;; LISTA1 y LISTA2. La función deberá devolver una nueva Lista con el resultado de evaluar 
;; elemento a elemento ambas Listas, indicando en forma de sublista ambos elementos, si coinciden 
;; en que sean números enteros. 

(defparameter max-elem 5)

(defun ingresar-lista (n)
    (format t "~%Ingrese los elementos de la lista N° ~a: ~%" n)
    (loop for i from 1 to max-elem do
        (format t "Elemento ~a: " i)
        (finish-output)
        collect (read)))

(defun imprimir-lista (n lista)
    (format t "~%Lista N° ~a: " n)
    (print lista)
    (terpri))

(defun ambos-enteros (lista1 lista2)
    (remove NIL
        (mapcar (lambda (x y)
            (if (and (integerp x) (integerp y))
                    (list x y)
                    NIL))
            lista1 lista2)))

(defun mostrar-resultados ()
    (let ((lista1 (ingresar-lista 1))
          (lista2 (ingresar-lista 2)))
        
        (imprimir-lista 1 lista1)
        (imprimir-lista 2 lista2)

        (format t "Pares enteros: ~a~%" (ambos-enteros lista1 lista2))))

(mostrar-resultados)