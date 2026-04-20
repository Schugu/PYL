;; A partir de una lista heterogénea que es ingresada por el operador, definir una función que 
;; permita el ingreso de dicha lista y pueda resolver cada una de las siguientes situaciones: 
;; • Definir una función que permita devolver una lista cuyos elementos serán sublistas. 
;; Cada sublista estará conformada por el elemento que sea una sublista de la lista 
;; ingresada por el operador junto con su longitud. 
;; • A partir de una lista heterogénea que es ingresada como parámetro, definir una función 
;; que devuelva una lista cuyos elementos son el resultado de evaluar uno a uno si cada 
;; uno elemento de la lista ingresada como parámetro es una sublista.  

(defparameter max-elem 5)

(defun ingresar-datos ()
    (let ((lista '()))
        (format t "Ingrese los elementos de la lista: ~%")
        (loop for i from 0 below max-elem do
            (format t "Elemento ~a: " (+ i 1))
            (finish-output)
            (push (read) lista))
        (reverse lista)))

(defun contar-sublistas (lista)
  (if (null lista)
      '()
      (let ((elemento (car lista))
            (resto (contar-sublistas (cdr lista))))
        (if (listp elemento)
            (cons (list elemento (length elemento)) resto)
            resto))))

(defun es-lista (lista)
    (if (null lista)
        '()
        (cons (listp (car lista))
            (es-lista (cdr lista)))))

(defun mostrar-resultados ()
    (let ((lista (ingresar-datos)))
        (setq *print-pretty* nil)
        (format t "Lista: ~s~%" lista)
        (format t "Sub-listas: ~a~%" (contar-sublistas lista))
        (format t "Son listas: ~a~%" (es-lista lista))))

(mostrar-resultados)