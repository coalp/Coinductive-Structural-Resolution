% :- load_files([s_reso_minimal]).
 :- load_files([co_s_reso_minimal]).
/*
my_member(H,[H|_]).
my_member(H,[_|X]) :- my_member(H,X).

blink([0,1|B]):- blink(B).
*/

% The following program is helpful for observing
% how co-S-reso manages the hypothesis, more specificly,
% rewriting reduction with hypothesis.
% It turns out that in this case the hypothesis are managed
% in the same way as Ancona's co-SLD does, just differing in that
% SLD is restricted to rewriting.

cond_a :- cond_a1,cond_a2,cond_a3.
cond_a1 :- cond_b1,cond_b2,cond_b3.
cond_b1 :- cond_c1,cond_c2,cond_c3.

cond_a2.
cond_a3.

cond_b2.
cond_b3.

cond_c1.
cond_c2.
cond_c3.

a  :- a1,a2.
a1 :- b1,b2.
b1 :- c1,c2.
a2.
b2.
c1.
c2.

% trace: clause_tree(cond_a,[])
% ----------------------------------------
% Help to formulate theory on substitution reduction with hypothesis
cond_c(s(a)).
cond_e(s(_)).
cond_f(X) :- cond_e(X),cond_c(X).
% trace: clause_tree(cond_f(X),[]).
