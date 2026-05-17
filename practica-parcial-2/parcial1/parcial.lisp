(defun ingresar-monto ()
    (format t "Ingrese el valor: ")
    (finish-output)
    (let ((x (read)))
        (if (and (numberp x) (plusp x))
            x
            (progn 
                (format t "Error: valor inválido.~%")
                (ingresar-monto)))))

(defun ingresar-valor (msg)
    (format t "~a~%" msg)
    (ingresar-monto))

(defun puede-comprar-arena (monto va)
    (cond 
        ((< monto va) "Monto insuficiente")
        ((= monto (* va 2)) "Monto justo")
        ((> monto (/ va 2)) "Monto suficiente")))

(defun puede-comprar-tanta-cantidad (monto va vp)
    (let ((mitad (/ monto 2)))
        (and 
            (>= mitad (* va 4))
            (>= mitad (* vp 1.5)))))

(defun cuanto-puede-comprar (monto va vp)
    (list 
        (list "Arena" monto (float (/ monto va)))
        (list "Piedra" monto (float (/ monto vp)))))

(defun mostrar-resultado ()
    (let ((va (ingresar-valor "Ingrese el valor de m³ de arena: "))
          (vp (ingresar-valor "Ingrese el valor de m³ de piedra: "))
          (monto (ingresar-valor "Ingrese el monto: ")))
        (format t "¿Puede comprar arena?: ~a~%" (puede-comprar-arena monto va))
        (format t "¿Puede comprar 4m³ de arena y 1.5m³ de piedra?: ~a~%"
            (if (puede-comprar-tanta-cantidad monto va vp) "Si" "No"))
        (format t "¿Cuanto puede comprar?: ~a~%"
            (cuanto-puede-comprar monto va vp))))

(mostrar-resultado)