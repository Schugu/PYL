;; Actividad N° 12: 
;; Definir una función llamada posición, que reciba como argumentos un elemento y una lista e 
;; indique la posición que ocupa el elemento en la lista.
(defun posicion (elem lista)
    (loop for contador from 0 below (length lista)
        do (if (equalp elem (nth contador lista))
            (return contador))))

;; Otra forma de hacerlo (no es mía)
;; (defun posicion (elem lista)
;;   (loop for x in lista
;;         for i from 0
;;         when (equalp x elem)
;;         do (return i)))

(defparameter lista '(1 2 3 4))

(defun mostrar-resultado (elem lista)
    (format t "Elemento: ~a encontrado en la posición: ~a~%." elem (posicion elem lista)))

(mostrar-resultado 4 lista)