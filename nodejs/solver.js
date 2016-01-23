exports.solve = function(input) {
  var words = input.split('+');
  return String(Number(words[0]) + Number(words[1]));
}
