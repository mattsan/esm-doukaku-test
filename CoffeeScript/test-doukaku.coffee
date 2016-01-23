fs = require 'fs'
solver = require './solver'

test = (input, expected) ->
  actual = solver.solve(input)
  if(actual == expected)
    process.stdout.write('.')
  else
    console.log """

      input:    #{input}
      expected: #{expected}
      actual:   #{actual}
    """

fs.readFile process.argv[2], 'utf8', (err, contents) ->
  for line in contents.split('\n')
    continue if line == ''
    [input, expected] = line.split(' ')
    test(input, expected)
  console.log()
