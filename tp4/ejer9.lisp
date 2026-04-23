;; Actividad N° 9: 
;; En un laboratorio de sistemas, dos programadores están trabajando con estructuras de 
;; datos que representan mediciones tomadas por dos sensores distintos. Cada sensor genera 
;; una lista de valores numéricos, y ambas listas —siempre del mismo tamaño— se 
;; almacenan juntas dentro de una estructura mayor. 
;; Un día, surge la necesidad de comparar estas mediciones para detectar posibles diferencias 
;; en el comportamiento de los sensores. 
;; El primer desafío que enfrentan es encontrar rápidamente el primer punto en el que los 
;; valores difieren. Para esto, uno de ellos propone crear una función llamada 
;; primerDesbalance, que recorra ambas listas en paralelo y, apenas detecte una diferencia, 
;; detenga el análisis y devuelva la posición correspondiente. Si no encuentra diferencias, 
;; deberá devolver NIL. La clave aquí es optimizar el proceso mediante un corte temprano, 
;; evitando recorrer innecesariamente toda la lista. 
;; Luego, se plantean una segunda pregunta: ¿los sensores coinciden hasta cierto punto? Así 
;; surge la función sonIgualesHasta, que, dada una posición N, permita verificar si todos los 
;; valores desde el inicio hasta esa posición son iguales en ambas listas. 
;; Finalmente, buscan obtener una visión más concreta de la coincidencia entre los sensores. 
;; Para ello, diseñan la función prefijoComun, que construya una nueva lista con todos los 
;; valores que coinciden consecutivamente desde el comienzo, deteniéndose justo en el primer 
;; punto de diferencia.

(defparameter lista1 '(1 2 3 4 5))
(defparameter lista2 '(1 2 3 4 2))


(defun primer-desbalance (lista1 lista2)
    (loop for i from 0 below (length lista1) do
        (let ((elem1 (nth i lista1))
              (elem2 (nth i lista2)))
            (if (/= elem1 elem2)
                (return-from primer-desbalance (list i elem1 elem2)))))
    NIL)


(defun imprimir-desbalance (lista1 lista2)
    (let ((resultado (primer-desbalance lista1 lista2)))
        (if (null resultado)
            (format t "No hay desbalances.~%")
            (format t "Primer desbalance en el lugar N° ~a, Valor 1: ~a, Valor 2: ~a~%"
            (first resultado) (second resultado)
            (third resultado)))))


(defun sonIgualesHasta (lista1 lista2 hasta)
    (loop for i from 0 below hasta do
        (let ((elem1 (nth i lista1))
              (elem2 (nth i lista2)))
            (if (/= elem1 elem2)
                (return-from sonIgualesHasta (list i elem1 elem2)))))
    NIL)

(defun imprimir-sonIgualesHasta (lista1 lista2 hasta)
  (if (> hasta (min (length lista1) (length lista2)))
      (format t "Error: el limite es superior a la longitud de las listas.~%")
      (let ((resultado (sonIgualesHasta lista1 lista2 hasta)))
        (if (null resultado)
            (format t "Siguen igual hasta el elemento N° ~a~%" hasta)
            (format t "Primer desbalance en el lugar N° ~a, Valor 1: ~a, Valor 2: ~a~%"
                    (first resultado)
                    (second resultado)
                    (third resultado))))))

(defun prefijo-comun (lista1 lista2)
    (let ((hasta 0)
          (resultado '())
          (desbalance (primer-desbalance lista1 lista2)))
        (if (null desbalance)
            (setq hasta (length lista1))
            (setq hasta (first desbalance)))
        (loop for i from 0 below hasta do
            (push (nth i lista1) resultado))
        (reverse resultado)))

(defun mostrar-resultados (lista1 lista2)
    (imprimir-desbalance lista1 lista2)
    (imprimir-sonIgualesHasta lista1 lista2 4)
    (format t "Valores que se repiten hasta que haya un desbalance: ~a~%" (prefijo-comun lista1 lista2)))

(mostrar-resultados lista1 lista2)