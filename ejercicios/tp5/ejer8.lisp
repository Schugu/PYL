;; Actividad Nº 8:  
;; Definir una función, la que a partir de dos listas ingresadas como parámetro, devuelva una nueva 
;; lista que asocie cada elemento no-numérico de la LISTA1 con el último elemento de la LISTA2.   

(defparameter lista1 '(a b c 4 5))
(defparameter lista2 '(1 2 3 4 5))

(defun funcion (lista1 lista2)
    (let ((ultimo (car (last lista2))))
        (remove NIL 
        (mapcar (lambda (x) 
            (if (not (numberp x))
                (list x ultimo))) 
            lista1))))

(print (funcion lista1 lista2))