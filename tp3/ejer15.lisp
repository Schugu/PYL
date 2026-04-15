;; Actividad N° 15: 
;; Un grupo de amigos comparten unas pizzas. Se desea saber cuanto tiene que pagar cada 
;; uno por las pizzas que consumen a partir del precio de 1 pizza y la cantidad de amigos que 
;; serán ingresadas a la función como parámetros. 
;; Tener en cuenta que cada persona come 3 porciones y sólo se pueden comprar pizzas 
;; enteras (que tiene cada una 8 porciones). 
;; Por ejemplo: 
;; Son 3 comensales, se necesitan entonces 9 porciones, lo que son dos pizzas, que salen 
;; $12.000 cada una, lo que implica $24.000 a dividir entre 3 = $8.000 cada uno. 

(defun calcular-porciones (comensales)
    (* comensales 3))

(defun calcular-pizzas (porciones)
    (ceiling (/ porciones 8)))

(defun calcular-precio-total (cant)
    (* cant 12000))

(defun calcular-precio-individual (total comensales)
    (/ total comensales))

(defun ingresar-datos()
    (format t "Porfavor ingrese la cantidad de comensales: ")
    (finish-output)
    (read))

(defun mostrar-resultado()
    (let* ((comensales (ingresar-datos))
        (porciones (calcular-porciones comensales))
        (cant-pizzas (calcular-pizzas porciones))
        (precio-total (calcular-precio-total cant-pizzas))
        (precio-individual (calcular-precio-individual precio-total comensales)))

        (format t "Total comensales: ~a~%" comensales)
        (format t "Porciones a consumir: ~a~%" porciones)
        (format t "Cantidad de pizzas: ~a~%" cant-pizzas)
        (format t "Precio total: ~a~%" precio-total)
        (format t "Precio por persona: ~a~%" precio-individual)))

(mostrar-resultado)