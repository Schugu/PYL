;; Actividad N° 4: 
;; Una entidad financiera evalúa préstamos según la edad y el sueldo del solicitante. Necesita 
;; incorporar a su sistema una función llamada evaluar-préstamo que implemente las 
;; siguientes reglas de negocio: 
;; a. Si la edad es menor a 18, se rechaza ("No apto"). 
;; b. Si tiene entre 18 y 25 años y el sueldo es mayor a 50.000, se otorga "Crédito Joven". 
;; c. Si tiene más de 25 años y el sueldo es mayor a 80.000, se otorga "Crédito Estándar". 
;; d. En cualquier otro caso, "En estudio". 
(defparameter solicitante '(18 1000))

(defun evaluar-prestamo (solicitante)
    (if (null solicitante)
        (format t "Error: los datos del solicitante están vacíos.~%")
        (let (
            (edad (car solicitante))
            (sueldo (cadr solicitante)))
        (if (< edad 18) 
            (format t "No apto~%")
            (if (and (>= edad 18) (<= edad 25) (> sueldo 50000))
                (format t "Crédito Joven.~%")
                (if (and (> edad 25) (> sueldo 80000))
                    (format t "Crédito Estándar.~%")
                    (format t "En estudio.~%")))))))

(evaluar-prestamo solicitante)


; Versión con cond (sin if's anidados)
;; (defun evaluar-prestamo (solicitante)
;;   (if (null solicitante)
;;       (format t "Error: los datos del solicitante están vacíos.~%")
;;       (let ((edad (car solicitante))
;;             (sueldo (cadr solicitante)))
;;       (cond
;;           ((< edad 18) (format t "No apto~%"))
;;           ((and (>= edad 18) (<= edad 25) (> sueldo 50000)) (format t "Crédito Joven.~%"))
;;           ((and (> edad 25) (> sueldo 80000)) (format t "Crédito Estándar.~%"))
;;           (t (format t "En estudio.~%"))))))