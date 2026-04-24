;; Actividad Nº 1. 
;; Evaluar las siguientes funciones y determinar su resultado 

;; (mapcar 'atom  '(a (b) () (()) “AA” 3))   => (T NIL T NIL T T)
;; (print (mapcar #'atom '(a (b) () (()) "AA" 3)))

;; (mapcar  'listp  '(a (b) () (()) "AA" 3))  => NIL T T T NIL NIL
;; (print (mapcar  'listp  '(a (b) () (()) "AA" 3)))

;; (mapcar  '>  '(5 8 3) '(4 9 2))  (T NIL T)
;; (print (mapcar  '>  '(5 8 3) '(4 9 2)))

;; (mapcar  '<  '(2 8 3) '(4 9 2) '(5 1 7))  => (T NIL NIL) 
;; (print (mapcar  '<  '(2 8 3) '(4 9 2) '(5 1 7)))

;; (mapcar  '>  '(5 8 3) '(4 9) '(3 8 1))  => (T NIL)
;; (print (mapcar  '>  '(5 8 3) '(4 9) '(3 8 1)))

;; (mapcar  '+   '(1 2) '(3 4) '(2 2))  => (6 8)
;; (print (mapcar '+ '(1 2) '(3 4) '(2 2)))

;; (mapcar  '-   '(1 8) '(3 4) '(2 2 9))  => (-4 2)
;; (print (mapcar '- '(1 8) '(3 4) '(2 2 9)))

;; (mapcar  'cons   '(1 2) '((a b) (3 4) ((7 8))))  => ((1 A B) (2 3 4)) 
;; (print (mapcar  #'cons   '(1 2) '((a b) (3 4) ((7 8)))))

;; (mapcar  'abs   '(0 -8 10 3 -2.5  -1/4 ))  => (0 8 10 3 2.5 1/4)
;; (print (mapcar  'abs   '(0 -8 10 3 -2.5  -1/4 )) )

;; (mapcar  'length  '((1 1 1) () ((8)) (a b)))  => (3 0 1 2)
;; (print (mapcar  'length  '((1 1 1) () ((8)) (a b))) )

;; (mapcar  'list   '(a b c d))  => ((a) (b) (c) (d))
;; (print (mapcar  'list   '(a b c d)))

;; (mapcar  'car '((2 3 4) (a b) ((c)) )  ) => (1 a (c))
;; (print (mapcar  'car '((2 3 4) (a b) ((c)))))