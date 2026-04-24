;; Actividad Nº 6  
;; Definir una función la que a partir de una lista heterogénea ingresada por el operador, devuelva 
;; una nueva lista formada por sublistas. Cada sublista será el resultado de comparar el elemento de 
;; la lista con 0 (cero) y tendrá el siguiente formato: ( X signo 0), donde 
;; • X:  será el elemento de la lista original 
;; • Signo:  será <, > o = dependiendo si el valor del elemento de la lista original es mayor, 
;; menor o igual a cero. 
;; • 0: será una constante que se corresponderá al valor cero    

(defparameter max-elem 5)

(defun ingresar-lista ()
    (format t "Ingrese los elementos de la lista: ~%")
    (loop for i from 1 to max-elem do
        (format t "Elemento ~a: " i)
        (finish-output)
        collect (read)))

(defun ingresar-num ()
    (loop 
        (format t "Ingrese el número entero para comparar: ")
        (finish-output)
        (let ((x (read)))
            (if (integerp x)
                (return x)
                (format t "Error: ~a no es un número entero.~%" x)))))

(defun comparar (lista comparacion)
  (mapcar (lambda (x)
            (cond
              ((= x comparacion) (list x '= comparacion))
              ((> x comparacion) (list x '> comparacion))
              (t (list x '< comparacion))))
          lista))

(defun mostrar-resultados()
    (let ((lista (ingresar-lista))
          (num (ingresar-num)))
        (format t "Lista:")
        (print lista)
        (format t "~%Número: ~a~%" num)
        (format t "Comparaciones:")
        (print (comparar lista num))))

(mostrar-resultados)