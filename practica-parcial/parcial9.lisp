;; Estructura de un registro de envío (usada en todos los ejercicios):

;; (id destinatario peso-kg distancia-km prioridad fragil)
;; ; prioridad es un símbolo: NORMAL, URGENTE o EXPRESS
;; ; fragil es T o NIL

;; Ejemplo: (1042 perez 3.5 120 URGENTE T)



;; Ejercicio 1 — 20 pts
;; Lógica de negocio sobre registro
;; Costo de envío con recargo por condición

;; La empresa calcula el costo base de un envío como el producto entre el peso en kg y la distancia en km, 
;; multiplicado por una tarifa fija de 0.05. Sin embargo, si el envío es frágil (T) y además el peso supera 
;; los 5 kg, se aplica un recargo adicional fijo de 200 unidades sobre el costo base.

;; Escribí la función costo-envio que reciba un único registro de envío (en el formato definido arriba) 
;; y devuelva el costo total correspondiente. Debés acceder a los campos del registro usando selectores 
;; de lista.

;; (costo-envio '(1042 perez 3.5 120 URGENTE T)) → 21.0
;; ; 3.5 × 120 × 0.05 = 21.0 → frágil pero peso ≤ 5, sin recargo
;; (costo-envio '(1055 gomez 8.0 200 NORMAL T)) → 280.0
;; ; 8.0 × 200 × 0.05 = 80.0 → frágil Y peso > 5 → 80.0 + 200 = 280.0
;; (costo-envio '(1060 luna 8.0 200 NORMAL NIL)) → 80.0
;; ; 8.0 × 200 × 0.05 = 80.0 → no frágil, sin recargo

(defun costo-envio (peso distancia fragil)
    (+ (* peso distancia 0.05) 
        (if (and fragil (> peso 5))
            200
            0)))

;; (print (costo-envio 3.5 120 T)) ; → 21.0
;; (print (costo-envio 8.0 200 T)) ; → 280.0
;; (print (costo-envio 8.0 200 NIL)) ; → 80.0



;; Ejercicio 2 — 25 pts
;; Condicional complejo con predicados
;; Clasificación de ruta de despacho

;; El sistema de despacho asigna una ruta logística a cada envío según una combinación de condiciones. 
;; Usando COND, escribí la función ruta-despacho que reciba un registro de envío y devuelva un símbolo 
;; según las siguientes reglas, evaluadas en orden de prioridad:

;; ; Regla 1 (máx. prioridad):
;; prioridad = EXPRESS → AVION

;; ; Regla 2:
;; prioridad = URGENTE AND fragil = T → CAMION-REFRIGERADO

;; ; Regla 3:
;; prioridad = URGENTE AND fragil = NIL → CAMION-RAPIDO

;; ; Regla 4:
;; prioridad = NORMAL AND distancia > 500 → TREN

;; ; Regla 5 (resto de casos):
;; cualquier otro caso → REPARTO-LOCAL

;; (ruta-despacho '(1001 torres 2.0 800 EXPRESS NIL)) → AVION
;; (ruta-despacho '(1002 rios 4.0 300 URGENTE T)) → CAMION-REFRIGERADO
;; (ruta-despacho '(1003 vera 6.0 600 NORMAL NIL)) → TREN
;; (ruta-despacho '(1004 diaz 1.5 80 NORMAL NIL)) → REPARTO-LOCAL

(defun ruta-despacho (distancia prioridad fragil)
    (cond 
        ((eq prioridad 'EXPRESS) 'AVION)
        ((and (eq prioridad 'URGENTE) fragil) 'CAMION-REFRIGERADO)
        ((and (eq prioridad 'URGENTE) (not fragil)) 'CAMION-RAPIDO)
        ((and (eq prioridad 'NORMAL) (> distancia 500)) 'TREN)
        (t 'REPARTO-LOCAL)))

;; (print (ruta-despacho 800 'EXPRESS NIL)) ; → AVION
;; (print (ruta-despacho 300 'URGENTE T)) ; → CAMION-REFRIGERADO
;; (print (ruta-despacho 600 'NORMAL NIL)) ; → TREN
;; (print (ruta-despacho 80 'NORMAL NIL)) ; → REPARTO-LOCAL


;; Ejercicio 3 — 30 pts
;; Recursividad con acumulación condicional
;; Peso total de envíos urgentes hacia destinos lejanos

;; El jefe de operaciones necesita conocer el peso total acumulado de todos los envíos que 
;; cumplan simultáneamente las siguientes condiciones: su prioridad es URGENTE o EXPRESS, 
;; y su distancia es mayor o igual a 300 km.

;; Escribí una función recursiva peso-critico-total que reciba una lista de registros de envío 
;; y devuelva dicho peso acumulado como número. Si ningún envío cumple las condiciones, debe devolver 0.

;; (peso-critico-total
;;   '((1001 torres 2.0 800 EXPRESS NIL)
;;     (1002 rios 4.5 300 URGENTE T)
;;     (1003 vera 6.0 150 URGENTE NIL)
;;     (1004 diaz 1.5 80 NORMAL NIL)
;;     (1005 luna 3.0 500 EXPRESS T)))
;; → 9.5
;; ; 1001: EXPRESS + 800km ✓ (2.0)
;; ; 1002: URGENTE + 300km ✓ (4.5)
;; ; 1003: URGENTE + 150km ✗ (distancia insuficiente)
;; ; 1004: NORMAL ✗
;; ; 1005: EXPRESS + 500km ✓ (3.0) → total: 2.0+4.5+3.0 = 9.5 

(defun peso-critico-total (lista)
    (if (null lista)
        0
        (let ((resto (peso-critico-total (cdr lista)))
              (elem (car lista)))
            (if (and 
                    (or (eq (fifth elem) 'URGENTE) 
                        (eq (fifth elem) 'EXPRESS)) 
                    (>= (fourth elem) 300))
                (+ (third elem) resto)
                resto))))

;; (print (peso-critico-total
;;   '((1001 torres 2.0 800 EXPRESS NIL)
;;     (1002 rios 4.5 300 URGENTE T)
;;     (1003 vera 6.0 150 URGENTE NIL)
;;     (1004 diaz 1.5 80 NORMAL NIL)
;;     (1005 luna 3.0 500 EXPRESS T))))


;; Ejercicio 4 — 25 pts
;; MAPCAR sobre listas de registros
;; Generación de etiquetas de despacho

;; El sistema de impresión necesita generar, a partir de la lista de envíos, una lista de etiquetas 
;; resumidas. Cada etiqueta es una sublista con exactamente tres campos: el id del envío, el destinatario 
;; y la ruta de despacho calculada con la misma lógica del Ejercicio 2.

;; Usando MAPCAR y una función LAMBDA, escribí la función generar-etiquetas que reciba una lista de 
;; registros de envío y devuelva la lista de etiquetas correspondiente. La LAMBDA debe extraer los 
;; campos usando selectores de lista y construir la sublista resultado con list. No está permitido 
;; usar recursión explícita en este ejercicio.

;; (generar-etiquetas
;;   '((1001 torres 2.0 800 EXPRESS NIL)
;;     (1002 rios 4.0 300 URGENTE T)
;;     (1004 diaz 1.5 80 NORMAL NIL)))
;; → ((1001 torres AVION)
;;     (1002 rios CAMION-REFRIGERADO)
;;     (1004 diaz REPARTO-LOCAL))

(defun generar-etiquetas (lista)
    (mapcar (lambda (x) 
                (list (car x) (cadr x) 
                (ruta-despacho (fourth x) (fifth x) (sixth x)))
            ) lista))

;; (print (generar-etiquetas
;;   '((1001 torres 2.0 800 EXPRESS NIL)
;;     (1002 rios 4.0 300 URGENTE T)
;;     (1004 diaz 1.5 80 NORMAL NIL))))