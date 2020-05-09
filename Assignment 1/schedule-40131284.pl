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

team(X), member(S, X),
findall(S, takes_course(S, _, _, _), LL),
length(LL, NN),
write(S), write(' has only taken '), write(NN),
write(' courses and tutorials in summer 2020.'), nl, fail.