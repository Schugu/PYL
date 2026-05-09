;; Actividad Nº 4: 
;; Definir una función que solicite al operador el ingreso de una lista no vacía y un número 
;; entero, de tal manera que devuelva una lista formada por sublistas. Cada sublista estará 
;; formada por el elemento de la lista original junto con su potencia ( el exponente de la 
;; potencia será el número entero ingresado por el operador)

(defun ingresar-numero ()
  (format t "Ingrese un número: ")
  (finish-output)

  (let ((num (read)))
    (if (integerp num)
        num
        (progn
          (format t "Número inválido.~%")
          (ingresar-numero)))))

(defun ingresar-potencia ()
  (format t "Ingrese un número positivo: ")
  (finish-output)

  (let ((num (read)))
    (if (and (integerp num) (>= num 0))
        num
        (progn
          (format t "Número inválido.~%")
          (ingresar-potencia)))))

(defun ingresar-lista-de-nums ()
    (let ((num (ingresar-numero)))
        (format t "¿Desea ingresar otro número? (1-Si / 2-No): ")
        (finish-output)
        (if (= (read) 1)
            (cons num (ingresar-lista-de-nums))
            (list num))))

(defun ingresar-datos()
    (format t "Ingreso de lista: ~%")
    (let ((lista (ingresar-lista-de-nums)))

         (format t "Ingeso de potencia: ~%")
         (let ((potencia (ingresar-potencia)))
         
            (list lista potencia))))

(defun potenciar-elementos (lista potencia)
    (mapcar 
        (lambda (x) (list x (expt x potencia))) 
        lista))

(defun mostrar-resultado ()
    (let ((datos (ingresar-datos)))
        (format t "Lista:")
        (print (car datos))
        
        (format t "~%Potencia ingresada: ~a~%" (cadr datos))

        (format t "Resultado:")
        (print (potenciar-elementos (car datos) (cadr datos)))))
        

(mostrar-resultado)