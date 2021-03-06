/*
	Question 10
*/



inv(0, 1).
inv(1, 0).

or(0, 0, 0).
or(0, 1, 1).
or(1, 0, 1).
or(1, 1, 1).

and(0, 0, 0).
and(0, 1, 0).
and(1, 0, 0).
and(1, 1, 1).

circuit(A, B, S, C):- 
	and(A, B, C), 
	or(A, B, Temp1), 
	inv(C, Temp2), 
	and(Temp1, Temp2, S).

/*
	?-circuit(0, _, S, C).
	outout: 
	C=0, S=0
	C=0, S=1
*/