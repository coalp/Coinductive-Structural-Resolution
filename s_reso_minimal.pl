:- load_files([search_rule]).
% --------------------------------------------------------------
%             Minimal Structural Resolution Engine
%   No support for built-in/library predicates to simplify the structure
%   and help to focus on the co-induction part
% --------------------------------------------------------------
clause_tree(true) :- !.
clause_tree((G,R)) :-
   !,
   clause_tree(G),
   clause_tree(R).

clause_tree(A) :-    % rewriting reduction
            unifying_and_matching_rule(A, Body),
            clause_tree(Body).
clause_tree(A) :-    % substitution reduction.
            unifying_but_matching_rule(A, _),
            clause_tree(A).
% ----------------------------------------------------------------
% File dependency: search_rule.pl
% ----------------------------------------------------------------
