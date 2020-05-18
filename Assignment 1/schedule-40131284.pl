team(['40131284','27877986', '480298']).
student_info('40131284', 'Shadi', 'Jiha').
student_info('27877986', 'Achoura', 'Bague').
student_info('480298', 'Caleb', 'Hoyne').

takes_course('40131284', 'comp', '348', 'aa').
takes_course('40131284', 'comp', '348', 'aaaf').
takes_course('40131284', 'comp', '352', 'aa').
takes_course('40131284', 'comp', '352', 'aaae').

takes_course('27877986', 'comp', '348', 'aa').
takes_course('27877986', 'comp', '348', 'aaaf').
takes_course('27877986', 'comp', '333', 'cc').

takes_course('480298', 'comp', '348', 'aa').
takes_course('480298', 'comp', '348', 'aaaf').

course_schedule('comp', '348', 'aa', 'mon', '1445', '1715').
course_schedule('comp', '348', 'aa', 'wed', '1445', '1715').
course_schedule('comp', '348', 'aaaf', 'mon', '1315', '1405').
course_schedule('comp', '348', 'aaaf', 'wed', '1315', '1405').
course_schedule('comp', '352', 'aa', 'tue', '1830', '2100').
course_schedule('comp', '352', 'aaae', 'wed', '1315', '1415').
course_schedule('comp', '333', 'cc', 'tue', '1315', '1545').
course_schedule('comp', '333', 'cc', 'thu', '1315', '1545').

/************************** Question 3 *************************/
/* Question 3 A */
get_sections(CNAME, CNUM, L) :- findall(L, course_schedule(CNAME, CNUM, L, _, _, _), L).
all_sections(CNAME, CNUM, L) :- get_sections(CNAME, CNUM, T), list_to_set(T, L).

/* Question 3 B */
has_taken(S, [CNAM|[CNUM|[SEC|[]]]]) :- takes_course(S, CNAM, CNUM, SEC).

/* Question 3 C */
has_taken2(S, [CNAM|[CNUM|[]]]) :- takes_course(S, CNAM, CNUM, _).

/* Question 3 D */
get_courses(S, L):- findall(T, takes_course(S, T, _, _), L).
all_subjects(S, L) :- get_courses(S, T), list_to_set(T, L).

/* Question 3 E */
takes_course_id('40131284', '10').
takes_course_id('40131284', '11').
takes_course_id('40131284', '12').
takes_course_id('40131284', '13').

takes_course_id('27877986', '10').
takes_course_id('27877986', '11').
takes_course_id('27877986', '14').

takes_course_id('480298', '10').
takes_course_id('480298', '11').

course_by_id('10', ['comp', '348', 'aa']).
course_by_id('11', ['comp', '348', 'aaaf']).
course_by_id('12', ['comp', '352', 'aa']).
course_by_id('13', ['comp', '352', 'aaae']).
course_by_id('14', ['comp', '333', 'cc']).

get_course_by_id(ID, L) :- course_by_id(ID, L).
get_student_courses(S, L) :- findall(T, takes_course_id(S, T), L).
id_to_list([], R).
id_to_list([L|T], [R|S]) :- get_course_by_id(L, R), id_to_list(T, S).
all_courses(S, L) :- get_student_courses(S, R), id_to_list(R, L).

/* Question 4 */
/* This is the query for Question 4 

team(X), member(S, X),
findall(S,(takes_course(S, _, _,aa)),LL),
length(LL, NN),
write(S), write(' has only taken '), write(NN),
write(' courses and tutorials in summer 2020.'), nl, fail.

*/

/* Question 11 */
add_to_start_list(X, [], [X]).		% this function inserts an element to the beginning of the list
add_to_start_list(X, [H|T], [H|T2]) :-
    add_to_start_list(X, T, T2).

reverse_list([], []).			% this function reverses the order of a list
reverse_list([H|T], Out) :-
    reverse_list(T, Out1),
    add_to_start_list(H, Out1, Out).

lucas(1, 2).		% Here we have the first base case (first number of lucas is 2)
lucas(2, 1).		% Here we have the second base case (first second of lucas is 1)
lucas(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    lucas(N1, F1),
    lucas(N2, F2),
    F is F1 + F2.

lucas_sequence(0, [0]).			
lucas_sequence(N, [H|T]) :- 	% This functions produces a lucas sequence inside a list but in reverse order
    lucas(N, H),
    N1 is N - 1,
    lucas_sequence(N1, T).

lucas_sequence_to_list(In, Out) :-	% This functions produces a lucas sequence inside a list in correct order
    lucas_sequence(In, Out1),
    reverse_list(Out1, Out).
