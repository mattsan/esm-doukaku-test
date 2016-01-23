var fs = require('fs');
var solver = require('./solver');

var test = function(input, expected) {
  var actual = solver.solve(input);
  if(actual == expected) {
    process.stdout.write('.');
  } else {
    console.log('\ninput:    %s\nexpected: %s\nactual:   %s', input, expected, actual);
  }
}

var dataFile = process.argv[2];
fs.readFile(dataFile, 'utf8', function(err, text) {
  for(var line of text.split('\n')) {
    if(line == '') continue;
    var words = line.split(' ');
    test(words[0], words[1]);
  }
  console.log();
});
