% $ gprolog --consult-file test-doukaku.prolog --entry-goal 'main' -- sample-data.txt

:- include('solver.prolog').

read_line_to_code(_, -1, end_of_file).
read_line_to_code(_, 10, []).
read_line_to_code(S, C, [C|CS]) :-
  read_line_to_codes(S, CS), !.

read_line_to_codes(S, CS) :-
  get_code(S, C),
  read_line_to_code(S, C, CS).

split(end_of_file, end_of_file, end_of_file).
split(Line, Input, Expected) :- append(Input, [0' |Expected], Line).

judge(_, Expected, Expected) :- write('.'), !.
judge(Input, Expected, Actual) :- format("~ninput:    ~s~nexpected: ~s~nactual:   ~s~n", [Input, Expected, Actual]), !.

test(end_of_file, end_of_file).
test(Input, Expected) :-
  solve(Input, Actual),
  judge(Input, Expected, Actual).

main :-
  current_prolog_flag(argv, [_,DataFile|_]),
  open(DataFile, read, S),
  repeat,
  read_line_to_codes(S, Line),
  split(Line, Input, Expected),
  test(Input, Expected),
  Line == end_of_file,
  close(S),
  write('\n'),
  halt.
