@solve = (input) ->
  [lhs, rhs] = input.split('+')
  String(Number(lhs) + Number(rhs))
