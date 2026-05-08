(defun ingresar-peso ()
    (format t "Ingrese el peso de su primera serie efectiva en kg: ")
    (finish-output)
    (let ((pr (read)))
        (if (and (numberp pr) (plusp pr))
            pr
            (progn 
                (format t "Error: debe ingresar un número positivo.~%")
                (ingresar-peso)))))


(defun calcular-porcentaje (num porcentaje)
    (/ (* num porcentaje) 100))

(defun mostrar-resultado ()
    (let ((peso (ingresar-peso)))
        (format t "Series de aproximación: ~%")
        (format t "Calentamiento general: Solo barra / máquina: 10-15 reps~%")
        (format t "1ra (35% de ~akg): ~,2fkg x 8 reps~%" peso (calcular-porcentaje peso 35))
        (format t "2da (55% de ~akg): ~,2fkg x 5-6 reps~%" peso (calcular-porcentaje peso 55))
        (format t "3ra (75% de ~akg): ~,2fkg x 2-3 reps~%" peso (calcular-porcentaje peso 75))
        (format t "4ta - Solo ejercicios pesados (90% de ~akg): ~,2fkg x 1 rep~%" 
            peso (calcular-porcentaje peso 90))))

(mostrar-resultado)