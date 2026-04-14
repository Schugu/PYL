;; Actividad N° 2: 
;; Definir una función predicado llamada palíndromo, que indique si una lista ingresada por el 
;; operador, es una lista palíndromo (se lee igual de izquierda a derecha y de derecha a 
;; izquierda). 
;; Por ejemplo: ( I T A T I) es una lista palíndromo

(defun lista-es-palindromo (lista)
    (let ((restador (- (length lista) 1)))
       (loop for contador from 0 below (floor (/ (length lista) 2))
            do 
                (if 
                    (not (equal (nth contador lista) (nth restador lista)))
                    (return NIL))        
                (setq restador (- restador 1))
            finally (return T))))

(defun mostrar-resultado-palindromo (lista) 
    (if (lista-es-palindromo lista)
        (format t "Es un palíndromo.~%")
        (format t "No es un palíndromo.~%")))

(mostrar-resultado-palindromo '(I T A T I))