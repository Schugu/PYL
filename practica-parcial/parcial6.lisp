;; Ejercicio 1 — 20 pts
;; Función simple
;; Cálculo de precio con descuento

;; Una tienda online aplica descuentos expresados como porcentaje sobre el precio original de un producto. 
;; Escribí una función precio-final que reciba el precio original (número) y el porcentaje de descuento 
;; (número entre 0 y 100), y devuelva el precio final a pagar luego de aplicar el descuento.

;; (precio-final 1500 20) → 1200
;; (precio-final 800 0) → 800
;; (precio-final 200 100) → 0

(defun calcular-descuento (valor desc)
    (* valor (/ desc 100)))

(defun aplicar-descuento (valor desc)
    (- valor (calcular-descuento valor desc)))

(defun precio-final (valor desc)
    (format t "Precio original: $~a~%" valor)
    (format t "Descuento: ~a%~%" desc)
    (format t "Precio a decontar: $~a~%" (calcular-descuento valor desc)) 
    (format t "Precio final: $~a~%" (aplicar-descuento valor desc)))

;; (precio-final 100 20)



;; Ejercicio 2 — 25 pts
;; Función definida por el usuario
;; Clasificación del estado de un pedido

;; El sistema de la tienda registra el estado de cada pedido mediante un código numérico entero. 
;; Escribí una función estado-pedido que reciba dicho código y devuelva un símbolo descriptivo 
;; según la siguiente tabla, usando COND:

;; código 1 → PENDIENTE
;; código 2 → EN-PREPARACION
;; código 3 → ENVIADO
;; código 4 → ENTREGADO
;; código 5 → CANCELADO
;; otro → DESCONOCIDO

;; (estado-pedido 3) → ENVIADO
;; (estado-pedido 7) → DESCONOCIDO

(defun ingresar-codigo ()
    (format t "Ingrese el código de pedido: ")
    (finish-output)
    (let ((x (read)))
        (if (numberp x)
            x
            (progn 
                (format t "Error: debe ingresar un número. ~%")
                (ingresar-codigo)))))

(defun clasif-pedido (cod)
    (case cod
        (1 'PENDIENTE)
        (2 'EN-PREPARACION)
        (3 'ENVIADO)
        (4 'ENTREGADO)
        (5 'CANCELADO)
        (otherwise 'DESCONOCIDO)))

(defun mostrar-resultado-pedidos ()
    (let ((cod (ingresar-codigo )))
        (format t "Estado del pedido ~a: ~a~%"
            cod (clasif-pedido cod))))

;; (mostrar-resultado-pedidos)




;; Ejercicio 3 — 30 pts
;; Función con recursividad
;; Búsqueda de productos con stock crítico

;; El catálogo de la tienda se representa como una lista de sublistas, donde cada sublista tiene la forma 
;; (nombre-producto categoria stock). Escribí una función recursiva stock-critico que reciba el catálogo y 
;; un umbral numérico, y devuelva una lista con los nombres de los productos cuyo stock sea estrictamente 
;; menor al umbral indicado.

;; (stock-critico
;;   '((remera ropa 3) (laptop electronica 0) (mochila accesorios 12) (auriculares electronica 2))
;;   4)
;; → (remera laptop auriculares)

(defparameter lista-stock '((remera ropa 3) (laptop electronica 0)  
                            (mochila accesorios 12) (auriculares electronica 2)
                            (lapicera utiles 100) (borrador utiles 200)))

(defun devolver-stock-critico (lista num)
    (if (null lista)
        '()
        (let ((elem (car lista))
              (resto (devolver-stock-critico (cdr lista) num)))
            (if (<= (third elem) num) 
                (cons (car elem) resto)
                resto
            ))))

;; (print (devolver-stock-critico lista-stock 10))


;; Ejercicio 4 — 25 pts
;; Función con MAPCAR
;; Aplicación de impuesto a lista de precios

;; La tienda debe emitir una factura actualizando todos los precios de una lista aplicándoles un porcentaje de 
;; impuesto (IVA). Usando MAPCAR y una función LAMBDA, escribí la función aplicar-iva que reciba una lista de 
;; precios (números) y un porcentaje de IVA, y devuelva una nueva lista con cada precio incrementado por dicho 
;; porcentaje. No está permitido usar recursión explícita en este ejercicio.

;; (aplicar-iva '(100 250 80 400) 21) → (121 302.5 96.8 484)
;; (aplicar-iva '(500) 10) → (550)

(defparameter lista-precios '(200 300 400 500 100))

(defun calcular-incremento (precio increm)
    (* precio (/ increm 100.0)))

(defun aplicar-incremento (precio increm)
    (+ precio (calcular-incremento precio increm)))

(defun aplicar-iva (lista iva)
    (mapcar (lambda (x) (aplicar-incremento x iva)) lista))

;; (print (aplicar-iva lista-precios 21))