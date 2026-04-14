;; Actividad N° 7: 
;; La máxima temperatura de ayer y las máximas temperaturas de enero y febrero se registran 
;; en dos listas, 
;; ● max_enero: que contendrá las máximas temperaturas registradas para cada uno de 
;; los días de enero  
;; ● max_febrero: que contendrá las máximas temperaturas registradas para cada uno de 
;; los días de febrero  

;; Actividad N° 8: 
;; Definir una función predicado que permita determinar si la temperatura máxima de ayer se 
;; registró también en enero o en febrero. (el valor atómico y las dos listas deben ser 
;; ingresadas por el operador) 

(defun verificar-en-listas (max_enero max_febrero temp_ayer)
  (cond 
    ((and (member temp_ayer max_enero) (member temp_ayer max_febrero)) 'AMBOS)
    ((member temp_ayer max_enero) 'ENERO)
    ((member temp_ayer max_febrero) 'FEBRERO)
    (t 'NINGUNO)))

(defun ingresar-datos ()
    (format t "Ingrese las máximas temperaturas de enero: ")
    (finish-output)
    (let ((max_enero (read)))
    
        (format t "Ingrese las máximas temperaturas de febrero: ")
        (finish-output)
        (let ((max_febrero (read)))
      
            (format t "Ingrese la temperatura de ayer: ")
            (finish-output)
            (let ((temp_ayer (read)))
        
                (let ((resultado (verificar-en-listas max_enero max_febrero temp_ayer)))
                (cond
                    ((eq resultado 'AMBOS) (format t "Pertenece a Enero y Febrero.~%"))
                    ((eq resultado 'ENERO) (format t "Pertenece a Enero.~%"))
                    ((eq resultado 'FEBRERO) (format t "Pertenece a Febrero.~%"))
                    (t (format t "No pertenece a Enero ni a Febrero.~%"))))))))

(ingresar-datos)