


(defun collatz (n)
(setq a (car n))
(setq li (list a))
(loop 
    (when (or (not (integerp a)) (not (plusp a)) (zerop a)) 
    (format t "Error, please enter valid number") (return nil))
    (if (oddp a) 
        (setq a (+ (* a 3) 1))
        (setq a (/ a 2))
    )
   (setq li (append li (list a)))
   (when (< a 2) (return a))
   
)
(cdr li)
)

(print (collatz '(47)))



(defun collatz2 (n)
    (setq b 0)
    (loop 
        (setq b (+ b 1))
        (print (collatz (list b)))
        
   (when (>= b n) (return b))
)

)

 (collatz2 20)


