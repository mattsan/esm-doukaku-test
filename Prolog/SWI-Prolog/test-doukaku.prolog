% $ swipl --traditional -s test-doukaku.prolog -g 'main.' -- sample-data.txt

:- use_module('solver.prolog').

split(end_of_file, end_of_file, end_of_file).
split(Line, Input, Expected) :- append(Input, [0' |Expected], Line).

judge(_, Expected, Expected) :- format("."), !.
judge(Input, Expected, Actual) :- format("~ninput:    ~p~nexpected: ~p~nactual:   ~p~n", [Input, Expected, Actual]), !.

test(end_of_file, end_of_file).
test(Input, Expected) :-
  solve(Input, Actual),
  judge(Input, Expected, Actual).

main :-
  current_prolog_flag(argv, [DataFile|_]),
  open(DataFile, read, S),
  repeat,
  read_line_to_codes(S, Line),
  split(Line, Input, Expected),
  test(Input, Expected),
  Line == end_of_file,
  close(S),
  format("~n"),
  halt.
