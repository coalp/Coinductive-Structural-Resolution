:- set_prolog_flag(generate_debug_info, false).
% choose clauses whose heads unifies with the goal, and specificly, matches the goal
unifying_and_matching_rule(A, Body) :-
         copy_term(A,A_copy),           % At run time variable A is bound to the current goal, A_copy then is a variant of A
         clause(A_copy,_,Ref),     % Note 1.
         clause(A1,_,Ref),         % Get a copy of the above mentioned rule
         subsumes_term(A1,A),           % check whether the head also matches the goal, any binding made for checking will be undone by implementation of subsumes_term/2.
         clause(A,Body,Ref).       % If matches, use this rule to reduce the goal.

% choose clauses whose head unifies with the goal, and specificly, does not match the goal
unifying_but_matching_rule(A, Body) :-
        copy_term(A,A_copy),
        clause(A_copy,_,Ref),
        clause(A1,_,Ref),
        \+ subsumes_term(A1,A),
        clause(A,Body,Ref).

  % Note 1: At run time, this procedure finds some clause whose head unifies with a variant of the current goal and get the clause reference number. Let's
  %         assume that the '_' is replaced by a named variable Body, and that the last procedure "user:rule(A,Body,Ref)" is removed. Then this will cause error
  %         in cases when the chosen clause indeed matches the goal and in this case it some variables in the body of the chosen clause share value with variables
  %         from the variant of current goal to which A_copy is bound. Further instantiation for the term bound to Body will not influence term bound to A, and
  %         this is not the desire behaviour.
  %         For this reason the body of  the choosen clause is disgarded, as by '_' in the procedure. And "user:rule(A,Body,Ref)" is added as the last step to make sure
  %         the goal is reduced by correct sub-goals.
