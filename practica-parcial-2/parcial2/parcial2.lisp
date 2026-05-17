(defun armo (A B)
    (cond 
        ((and (consp A) (consp B)) (append A B))
        ((and (consp A) (not (consp B))) (list A B))
        ((and (not (consp A)) (consp B)) (cons A B))
        (t (list A B))))

;; (print (armo (car '(+ 20 5 2)) (* (+ 3 2) 10)))

;; (print (armo '(* 7 10 (-15 5)) (cdr '(+ 3 4))))

;; (print (armo (+ 3 4) (last '(* 7 10 (-15 5)))))

;; (print (armo (member 3 '(+ 3 4)) (numberp 4)))

(defun ingresar-monto ()
    (format t "Ingrese el monto: ")
    (finish-output)
    (let ((monto (read)))
        (if (and (numberp monto) (plusp monto))
            monto
            (progn 
                (format t "Error: monto inválido.~%")
                (ingresar-monto)))))

(defun cuanto-puede-comprar-azucar (monto)
    (let ((dest-azucar (/ monto 4)))
        (list monto 
        (if (>= dest-azucar 80)
            (float (/ dest-azucar 80))
            0))))

(defun se-puede-comprar-cafe (monto)
    (let ((cafe (* 1500 2))
          (dest-cafe (* (/ monto 4) 3)))
        (>= dest-cafe cafe)))

(defun mostrar-resultado ()
    (let ((monto (ingresar-monto)))
        (print (cuanto-puede-comprar-azucar monto))
        (print (se-puede-comprar-cafe monto))))

(mostrar-resultado)