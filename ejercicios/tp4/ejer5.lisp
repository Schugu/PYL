;; A partir de una lista que es ingresada por el operador, definir una función que devuelva una 
;; nueva lista conteniendo dos sublistas. La primer sublista estará formada por los elementos de 
;; la lista original que son números pares. La segunda sublista estará formada por los elementos 
;; de la lista original que son números impares.

(defparameter max-elem 5)

(defun ingresar-datos ()
    (format t "Ingrese los elementos de la lista: ~%")
    (let ((lista '()))
        (loop for i from 0 below max-elem do
            (format t "Elemento ~a: " (+ i 1))
            (finish-output)
            (push (read) lista))
        (reverse lista)))

(defun separar-elementos-pares (lista)
  (if (null lista)
      (list '() '()) 
      (let* ((resultado (separar-elementos-pares (cdr lista)))
             (pares (first resultado))
             (impares (second resultado))
             (elem (car lista)))
        (if (evenp elem)
            (list (cons elem pares) impares)
            (list pares (cons elem impares))))))

(defun mostrar-resultados ()
    (let ((lista (ingresar-datos)))
        (format t "Lista: ~a~%" lista)
        (format t "Lista separada: ~a~%" (separar-elementos-pares lista))))

(mostrar-resultados)