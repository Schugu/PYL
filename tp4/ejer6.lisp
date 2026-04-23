;; A partir de un valor atómico y una lista heterogénea, desarrollar una función que permita 
;; ingresar la lista, el valor atómico y ejecutar las funciones que se solicitan. Recordar que una 
;; lista es heterogénea cuando puede contener átomos, listas, o ambos tipos de elementos, 
;; 1. Una función predicado, la que a partir de la lista ingresada como parámetro, determine si la 
;; misma contiene únicamente valores atómicos. 
;; 2. Una función, la que a partir de la lista y el valor atómico, 
;; determine la cantidad de valores que sean menores o iguales al valor atómico 
;; 3. Una función, la que a partir de la lista y el valor atómico, devuelva una nueva lista 
;; formada por sublistas, donde cada sublista estrá formada por el elemento de la lista original 
;; junto con el resultado de la división entre el elemento de la lista y el valor atómico, siempre y 
;; cuando el elemento de la lista original sea mayor a cero.

;; Está medio rara la consigna asi que está vibe codeado

;; Definición del límite para la carga de datos
(defparameter *max-elem* 5)

;; --- 1. FUNCIÓN PARA INGRESAR DATOS ---
(defun ingresar-datos ()
  (format t "~%--- Ingreso de datos para la lista ---~%")
  (loop for i from 1 to *max-elem*
        do (format t "Ingrese elemento ~a (puede ser número, lista o átomo): " i)
           (finish-output)
        collect (read)))

;; --- 2. PREDICADO: ¿SOLO ÁTOMOS? ---
(defun solo-atomos-p (lista)
  "Retorna T si la lista no contiene sublistas."
  (every #'atom lista))

;; --- 3. CONTAR MENORES O IGUALES AL ATÓMICO ---
(defun contar-menores-o-iguales (lista valor-atomico)
  "Filtra solo los números para poder comparar sin errores."
  (loop for x in lista
        count (and (numberp x) 
                   (<= x valor-atomico))))

;; --- 4. GENERAR LISTA DE DIVISIONES ---
(defun generar-divisiones (lista valor-atomico)
  "Crea sublistas (elemento resultado) solo si el elemento es número y > 0."
  (loop for x in lista
        when (and (numberp x) (> x 0))
        collect (list x (float (/ x valor-atomico))))) ; Usamos float para ver decimales

;; --- FUNCIÓN PRINCIPAL (ORQUESTADORA) ---
(defun ejecutar-ejercicio ()
  (let ((lista (ingresar-datos))
        (atomo (progn 
                 (format t "~%Ingrese el valor atómico numérico para comparar/dividir: ")
                 (finish-output)
                 (read))))
    
    (format t "~%--- RESULTADOS ---~%")
    (format t "Lista ingresada: ~a~%" lista)
    (format t "Valor atómico: ~a~%" atomo)
    
    ;; 1. Prueba de solo átomos
    (if (solo-atomos-p lista)
        (format t "1. La lista contiene ÚNICAMENTE valores atómicos.~%")
        (format t "1. La lista es heterogénea (contiene sublistas).~%"))
    
    ;; 2. Conteo de menores o iguales
    (format t "2. Cantidad de números <= ~a: ~a~%" 
            atomo (contar-menores-o-iguales lista atomo))
    
    ;; 3. Lista de divisiones
    (format t "3. Nueva lista (elemento división): ~s~%" 
            (generar-divisiones lista atomo))))

;; Ejecución
(ejecutar-ejercicio)