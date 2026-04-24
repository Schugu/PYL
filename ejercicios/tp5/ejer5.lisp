;; Actividad Nº 5: 
;; Definir una función que solicite al operador el ingreso de una lista no vacía y un número entero, de 
;; tal manera que devuelva una lista formada por sublistas. Cada sublista estará formada por el 
;; elemento de la lista original junto con su potencia ( el exponte de la potencia será el número entero 
;; ingresado por el operador)  

(defparameter max-elem 5)

(defun ingresar-lista ()
    (format t "Ingrese los datos de la lista: ~%")
    (loop for i from 1 to max-elem do 
        (format t "Elemento ~a: " i)
        (finish-output)
        collect (read)))

(defun ingresar-num ()
    (loop 
        (format t "Ingrese el número entero: ")
        (finish-output)
        (let ((x (read)))
            (if (integerp x)
                (return x)
                (format t "Error: ~a no es un número entero.~%" x)))))

(defun potenciar-lista (lista num)
    (mapcar (lambda (x) (list x (expt x num))) lista))

(defun mostrar-resultados ()
    (let ((lista (ingresar-lista))
          (num (ingresar-num)))
        (format t "Lista:")
        (print lista)
        (format t "~%Número: ~a~%" num)
        (print (potenciar-lista lista num))))

(mostrar-resultados)