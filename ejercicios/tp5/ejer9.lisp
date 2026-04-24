;; Actividad Nº 9:  
;; Definir la función sumo-ambos, la que a partir de 2 Listas no vacías: LISTA1 y LISTA2, devuelva 
;; una nueva Lista con el resultado de sumar elemento a elemento, los elementos de la misma 
;; posición. (1° elemento de LISTA1 con el 1° elemento de LISTA”, 2° elemento de LISTA1 con el 2° 
;; elemento de LISTA”, ….) 

;; Resolución con recursividad
;; (defun suma-ambos (lista1 lista2)
;;     (if (or (null lista1) (null lista2))
;;         '()
;;         (cons (+ (car lista1) (car lista2)) (suma-ambos (cdr lista1) (cdr lista2)))))

;; Resolución con mapcar
(defun suma-ambos (lista1 lista2)
  (mapcar #'+ lista1 lista2))

(print (suma-ambos '(1 2 3) '(2 3 4)))