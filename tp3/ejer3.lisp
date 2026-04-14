;; Actividad N° 3: 
;; Definir una función llamada describir que reciba un único argumento x y devuelva: 
;; ● Si x es la lista vacía: el símbolo vacío (por ejemplo, VACIA). 
;; ● Si x es un átomo: una lista (ATOMO x). 
;; ● Si x es una lista no vacía: una lista (LISTA n primero) donde n es la longitud de la 
;; lista y primero es el primer elemento. 

(defun describir (x)
    (if (listp x) 
        (if (null x) 
            'VACIA
            (list 'LISTA (length x) (car x))
        )
        (list 'ATOMO x)))

(defun mostrar-resultado (x)
  (format t "Resultado: ~a~%" (describir x)))

(mostrar-resultado '())
(mostrar-resultado 'A)
(mostrar-resultado '(A B C))