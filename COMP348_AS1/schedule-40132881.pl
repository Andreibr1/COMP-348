team(['40132881', '40132235']).
student_info('40132881', 'Andre', 'Ibrahim').
student_info('40132235', 'Alexandru', 'Bara').
takes_course('40132881', 'comp', '348', 'ab').
takes_course('40132881', 'comp', '348', 'abae').
takes_course('40132881', 'comp', '352', 'aa').
takes_course('40132881', 'comp', '352', 'aaae').
takes_course('40132881', 'engr', '202', 'aa').
takes_course('40132235', 'comp', '348', 'ab').
takes_course('40132235', 'comp', '348', 'abae').
takes_course('40132235', 'comp', '352', 'aa').
takes_course('40132235', 'comp', '352', 'aaae').
takes_course('40132235', 'engr', '202', 'ab').
takes_course('40132235', 'econ', '203', 'ec').
course_schedule('comp', '348', 'ab', 'tue', '1315', '1545').
course_schedule('comp', '348', 'ab', 'thu', '1315', '1545').
course_schedule('comp', '348', 'abae', 'tue', '1615', '1705').
course_schedule('comp', '348', 'abae', 'thu', '1615', '1705').
course_schedule('comp', '352', 'aa', 'tue', '1830', '2100').
course_schedule('comp', '352', 'aa', 'thu', '1830', '2100').
course_schedule('comp', '352', 'aaae', 'tue', '1215', '1305').
course_schedule('comp', '352', 'aaae', 'thu', '1215', '1305').
course_schedule('engr', '202', 'aa', 'mon', '1145', '1300').
course_schedule('engr', '202', 'aa', 'wed', '1145', '1300').
course_schedule('engr', '202', 'ab', 'wed', '1015', '1300').
all_sections(CNAM, CNUM, L) :- findall( X ,takes_course(_, CNAM, CNUM , X), L1), list_to_set(L1, L).
/* L contains a list of all sections of course CNAME, CNUM,
i.e. calling all_sections(_, 'comp', '348', L) will result in L=['aa', 'ab'];
no duplicates */
has_taken(S, [CNAM|[CNUM|[SEC|[]]]]) :- takes_course(S, CNAM, CNUM, SEC), !.
/* true if student S takes the course CNAM CNUM SEC,
e.g. takes('4000123', ['comp', '348', 'aa']) */
has_taken2(S, [CNAM|[CNUM|[]]]) :- takes_course(S, CNAM, CNUM, _), !.
/* true if S takes any sections of the course CNAM CNUM,
e.g. takes('4000123', ['comp', '348']) */
all_subjects(S, L) :-findall(Course, takes_course(S, Course, _, _), List), list_to_set(List, L).
/* L contains all the courses subjects that have been
taken by student S, i.e. ['comp', 'soen']; no duplicates */
all_courses(S, L) :- findall([X, Y, Z], takes_course(S, X, Y, Z), L).
/* L contains all the courses that have been taken by
student S, i.e. all_courses('4000123', L) will result in
L=[['comp', '348', 'aa'], ['comp', '348', 'ab']] */
all_courses2(S, L) :- findall([X, Y], takes_course(S, X, Y, _), L1), list_to_set(L1, L).
/* similar to all_courses but without section info;
no duplicates */