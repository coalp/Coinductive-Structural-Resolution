:- load_files([co_s_reso_minimal]).

% trace: clause_tree(cond_f(X),[f(X)])
% f(X) is a dummy hypothesis for demo purpose.
cond_c(_).
cond_e(s(X)) :- cond_f(X).
cond_f(X) :- cond_e(X),cond_c(X).
cond_d(X) :- cond_f(s(X)).

r(_).
p(s(X)) :- q(X).
q(X) :- p(X),r(X).
