;; Actividad Nº 5: 
;; Definir una función la que a partir de una lista heterogénea ingresada por el operador, 
;; devuelva una nueva lista formada por sublistas. Cada sublista será el resultado de comparar 
;; el elemento de la lista con 0 (cero) y tendrá el siguiente formato: ( X signo 0), donde 
;; ● X: será el elemento de la lista original 
;; ● Signo: será <, > o = dependiendo si el valor del elemento de la lista original es 
;; mayor, menor o igual a cero. 
;; ● 0: será una constante que se corresponderá al valor cero

;; ¿Acá no seria una lista homogénea?

(defparameter comparacion 0)

(defun ingresar-numero ()
    (format t "Ingrese el número: ")
    (finish-output)
    (let ((num (read)))
        (if (numberp num)
            num
            (progn 
                (format t "Número inválido.~%")
                (ingresar-numero)))))

(defun ingresar-lista ()
    (let ((num (ingresar-numero)))
        (format t "¿Desea ingresar otro número? (1-Si / 2-No): ")
        (finish-output)
        (if (= (read) 1)
            (cons num (ingresar-lista))
            (list num))))

(defun obtener-signo (a b)
    (cond 
        ((= a b) '=)
        ((> a b) '>)
        ((< a b) '<)))

(defun comparar-elementos (lista comparacion)
    (mapcar 
        (lambda (x) 
            (list x (obtener-signo x comparacion) comparacion)
        ) lista))

(defun mostrar-resultado ()
    (let ((lista (ingresar-lista)))
        (format t "Lista:")
        (print lista)
        (format t "~%Resultado:")
        (print (comparar-elementos lista comparacion))))

(mostrar-resultado)