:- module(solver, [solve/2]).

split(Input, Lhs, Rhs) :- append(Lhs, [0'+|Rhs], Input).

solve(Input, Output) :-
  split(Input, LS, RS),
  number_codes(LN, LS),
  number_codes(RN, RS),
  N is LN + RN,
  number_codes(N, Output).
