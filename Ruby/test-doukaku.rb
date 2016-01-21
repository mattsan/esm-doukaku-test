# example:
#   $ ruby -I . test-doukaku.rb sample-solver.rb sample-data.txt

solver = ARGV.shift
data_file = ARGV.shift

require "#{solver}"

def test(input, expected)
  actual = solve(input)
  if actual == expected
    print '.'
  else
    print <<-EOS

input:     #{input}
expectied: #{expected}
actual:    #{actual}
    EOS
  end
end

File.open(data_file).each_line do |line|
  test(*line.split)
end
puts
