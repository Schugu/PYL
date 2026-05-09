(defparameter desc-efectivo 15)
(defparameter cuotas-default '((1 0) (3 10) (6 25) (9 40) (12 60)))
(defparameter cuotas-santander '((1 0) (3 5) (6 20) (9 30) (12 40)))
(defparameter precio-min-para-cuotas 10000)
(defparameter recargo-mp 5)

(defun ingresar-precio ()
    (format t "Ingrese el precio de lista: ")
    (finish-output)
    (let ((precio (read)))
        (if (and (numberp precio) (plusp precio))
            precio
            (progn 
                (format t "Error: el precio debe ser un número positivo.~&")
                (ingresar-precio)))))

(defun calcular-porcentaje (precio porcentaje)
    (* precio (/ porcentaje 100)))

(defun aplicar-descuento (precio porcentaje)
    (- precio (calcular-porcentaje precio porcentaje )))

(defun aplicar-recargo (precio porcentaje)
    (+ precio (calcular-porcentaje precio porcentaje )))


(defun imprimir-sec-efectivo (precio)
    (format t "~%===| Pagando en efectivo |===~%")
    (format t "Descuento a aplicar: ~,2f%~%" desc-efectivo)
    (format t "Valor a descontar: $~,2f~%" (calcular-porcentaje precio desc-efectivo ))
    (format t "Total a pagar: $~,2f~%" (aplicar-descuento precio desc-efectivo )))


(defun calcular-cuotas (precio lista-cuotas)
    (mapcar (lambda (x) 
        (let* ((cuotas (car x))
              (recargo (cadr x))
              (total (aplicar-recargo precio recargo)))
            (list cuotas recargo total (float (/ total cuotas)))))
        lista-cuotas)) 

(defun imprimir-cuotas (lista-cuotas)
    (if (null lista-cuotas)
        nil
        (let ((elem (car lista-cuotas)))
            (format t "====================================~%")
            (format t "Cantidad de cuotas: ~a~%" (car elem))
            (format t "Recargo: ~,2f%~%" (cadr elem))
            (format t "Valor total: $~,2f~%" (caddr elem))
            (format t "Valor a pagar por cuota: $~,2f~%" (cadddr elem))
            (imprimir-cuotas (cdr lista-cuotas)))))

(defun imprimir-sec-tarjeta-default (precio)
    (format t "~%~%===| Pagando con tarjeta de crédito default |===~%")
    (if (>= precio precio-min-para-cuotas)
        (imprimir-cuotas (calcular-cuotas precio cuotas-default))
        (progn 
            (format t "====================================~%")
            (format t "Cantidad de cuotas: ~a~%" 1)
            (format t "Recargo: ~,2f%~%" 0)
            (format t "Valor total: $~,2f~%" precio))))

(defun imprimir-sec-tarjeta-santander (precio)
    (format t "~%~%===| Pagando con tarjeta de crédito Santander |===~%")
    (if (>= precio precio-min-para-cuotas)
        (imprimir-cuotas (calcular-cuotas precio cuotas-santander))
        (progn 
            (format t "====================================~%")
            (format t "Cantidad de cuotas: ~a~%" 1)
            (format t "Recargo: ~,2f%~%" 0)
            (format t "Valor total: $~,2f~%" precio))))

(defun imprimir-mp (precio)
    (format t "~%~%===| Pagando con Mercado Pago |===~%")
    (format t "Recargo: ~,2f%~%" recargo-mp)
    (format t "Valor del recargo: $~,2f~%" (calcular-porcentaje precio recargo-mp))
    (format t "Total a pagar: $~,2f~%" (aplicar-recargo precio recargo-mp )))


(defun mostrar-resultado ()
    (let ((precio-lista (ingresar-precio)))
        (format t "Precio de lista: $~a~%" precio-lista)
        
        (imprimir-sec-efectivo precio-lista)
        (imprimir-sec-tarjeta-default precio-lista)
        (imprimir-sec-tarjeta-santander precio-lista)
        (imprimir-mp precio-lista)))

(mostrar-resultado)