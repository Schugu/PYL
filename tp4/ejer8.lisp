;; Actividad N° 8: 
;; En una empresa de diseño digital, el equipo de sistemas administra diariamente una gran 
;; cantidad de archivos. Para organizar mejor la información, mantienen separados los 
;; tamaños de los archivos en dos listas: una llamada arch_graficos, que contiene los tamaños 
;; de los archivos gráficos, y otra llamada arch_texto, con los tamaños de los documentos de 
;; texto. 
;; Un día, surge la necesidad de analizar estos datos para optimizar el almacenamiento. 
;; Entonces, un integrante del equipo comienza a plantearse algunas preguntas clave. 
;; Primero, quiere verificar si existe cierta simetría en los archivos gráficos. Para ello, decide 
;; crear una función predicado que le permita saber si el primer archivo gráfico tiene el mismo 
;; tamaño que el último de la lista. 
;; Luego, se interesa por comparar el espacio total ocupado por cada tipo de archivo. Así, 
;; busca determinar si los archivos gráficos consumen más espacio que los archivos de texto, 
;; lo que podría indicar la necesidad de aplicar estrategias de compresión o reorganización. 
;; Finalmente, con una mirada más detallada, propone combinar ambas listas. La idea es 
;; analizar los archivos en la misma posición de cada lista (por ejemplo, el primero con el 
;; primero, el segundo con el segundo, etc.) y generar una nueva lista con la suma de sus 
;; tamaños. Sin embargo, no todas las combinaciones resultan relevantes, por lo que decide 
;; considerar únicamente aquellas sumas que sean mayores a un valor determinado, 
;; almacenado en una variable adicional.

(defparameter arch_graficos '(20 20 30 40 60))
(defparameter arch_textos '(20 20 30 40 60))

(defun igual-pri-ult (lista)
    (if (null lista)
        NIL
        (eql (car lista) (car (last lista)))))

(defun tamaño-total (lista)
    (if (null lista)
        0
        (+ (car lista) (tamaño-total (cdr lista)))))

(defun consume-mas (arch_graficos arch_textos)
  (let ((graf (tamaño-total arch_graficos))
        (text (tamaño-total arch_textos)))
    (cond ((= graf text) "Graficos y Texto Consúmen lo mismo")
          ((> graf text) "Graficos consúmen más")
          (t "de texto consúmen más"))))

(defun imprimir-resultados (lista)
    (format t "Lista de tamaños: ~a~%" lista)
    (format t "¿El primer archivo tiene el mismo tamaño que el ultimo?: ~a~%"
        (if (igual-pri-ult lista) "Si" "No"))
    (format t "Tamaño total: ~a~%" (tamaño-total lista))
    (format t "~%")
)

(defun combinar-y-filtrar (l1 l2 limite)
  (if (or (null l1) (null l2))
      '()
      (let ((suma (+ (car l1) (car l2))))
        (if (> suma limite)
            (cons suma (combinar-y-filtrar (cdr l1) (cdr l2) limite))
            (combinar-y-filtrar (cdr l1) (cdr l2) limite)))))

(defun mostrar-resultados (arch_graficos arch_textos)
    (format t "Archivos Graficos: ~%")
    (imprimir-resultados arch_graficos)

    (format t "Archivos de texto: ~%")
    (imprimir-resultados arch_textos)

    (format t "Los archivos ~a~%" (consume-mas arch_graficos arch_textos))

    (format t "Suma de archivos (mayores a ~a): ~a~%" 
        100 (combinar-y-filtrar arch_graficos arch_textos 100))
)

(mostrar-resultados arch_graficos arch_textos)