/* course(course_number, course_name, credits) */

course(cs101,python, 2).
course(mth210, calculusI, 5).
course(cs120, web_design, 3).
course(cs200, data_structures, 4).
course(cs210, algorithms, 4).
course(wrt101, basic_writing, 3).

/* section(CRN, course_number) */

section(1522,cs101).
section(1122,cs101).
section(2322,mth210).
section(2421,cs120).
section(8522,mth210).
section(1621,cs200).
section(7822,mth210).
section(2822,cs210).
section(3522,wrt101).

/* place( CRN, building, time) */

place(1522,owen102,10).
place(1122,dear118,11).
place(2322,with210,11).
place(2421,cov216,15).
place(8522,kec1001,13).
place(1621,cov216,14).
place(7822,kec1001,14).
place(2822,owen102,13).
place(3522,with210,15).

/* enroll(sid, CRN) */

enroll(122,1522).
enroll(122,8522).
enroll(150,1522).
enroll(150,2421).
enroll(212,7822).
enroll(300,2822).
enroll(300,8522).
enroll(310,3522).
enroll(310,8522).
enroll(310,1621).
enroll(175,2822).
enroll(175,7822).
enroll(175,3522).
enroll(410,1621).
enroll(410,7822).
enroll(113,3522).

/* student(sid, student_name, major) */

student(122, mary, cs).
student(150, john, math).
student(212, jim, ece).
student(300, lee, cs).
student(310, pat, cs).
student(175, amy, math).
student(410, john, cs).
student(113, zoe, ece).

/****************** Homework 7 *******************
*                                                *
* Author: Nils Streedain                         *
*                                                *
*************************************************/

/* Problem 1. Database Application */

% 1. schedule/4: Finds a student's course, building, and time.
schedule(SID, Course, Building, Time) :-
    enroll(SID, CRN),               % Matches SID with CRN
    section(CRN, CourseNum),        % Gets course number for CRN
    course(CourseNum, Course, _),   % Matches course number with course
    place(CRN, Building, Time).     % Gets building and time for CRN

% 2. schedule/3: Finds a student's name and course names.
schedule(SID, StudentName, Course) :-
    student(SID, StudentName, _),   % Gets student name for SID
    enroll(SID, CRN),               % Matches SID with CRN
    section(CRN, CourseNum),        % Gets course number for CRN
    course(CourseNum, Course, _).   % Matches course number with course

% 3. offer/4: Finds course number, course name, CRN, and times offered.
offer(CourseNum, Course, CRN, Time) :-
    course(CourseNum, Course, _),   % Matches course number with course
    section(CRN, CourseNum),        % Matches CRN with course number
    place(CRN, _, Time).            % Gets time for CRN
