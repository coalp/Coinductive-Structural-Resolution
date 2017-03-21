
clause_tree(true, _) :- !.

% Trail is initialised to empty list when calling clause_tree/2.
clause_tree((G,R), Hypo) :-
   !,
   clause_tree(G, Hypo),
   clause_tree(R, Hypo).

clause_tree(G, Hypo) :-
    loop_detect(G,Hypo).

clause_tree(G, Hypo) :-
     clause(G,Body),
     clause_tree(Body, [G|Hypo]).

loop_detect(G, [G1|_]) :- G = G1.
loop_detect(G, [_|R]) :- loop_detect(G, R).
