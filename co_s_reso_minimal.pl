:- load_files([search_rule]).
% --------------------------------------------------------------
%        Minimal Structural Resolution Engine with Loop Detection
%   No support for built-in/library predicates to simplify the structure
%   and help to focus on the co-induction part
% --------------------------------------------------------------
% ----------------------------------------------------------------
% File dependency: search_rule.pl
% ----------------------------------------------------------------
%----------------------------------------------------------------
% Co-inductive part
% With each goal, associate a hypothesis set, as in Ancona'a paper.
% clause_tree(Goal, Hypo)
%----------------------------------------------------------------
clause_tree(true,_) :- !.
clause_tree((G,R), Hypo) :-
   !,
   clause_tree(G, Hypo),
   clause_tree(R, Hypo).

clause_tree(A,Hypo) :- find_loop(A,Hypo).

clause_tree(A, Hypo) :-    % rewriting reduction
            unifying_and_matching_rule(A, Body),
            clause_tree(Body, [A|Hypo]).  % A is not instantiated by finding a matching clause

clause_tree(A, Hypo) :-    % substitution reduction.
            unifying_but_matching_rule(A, _),
            clause_tree(A, Hypo).

%--------------------------------------------------------------
find_loop(A,[B|_]) :- A = B.
find_loop(A,[_|C]) :- find_loop(A,C).
