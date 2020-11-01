require 'json'

def result(names, status)
  last = names.pop

  "#{names.join(', ')} and #{last} are #{status}"
end

def names(names_hash)
  names_hash.map { |student| student['name'] }
end

data_hash = JSON.parse(File.read('grades.json'))

average = data_hash.map { |data| data['grade'] }.sum / data_hash.size
passed = data_hash.select { |data| data['grade'] >= average }
failed = data_hash.select { |data| data['grade'] < average }

puts "Average grade is #{average}"
puts result(names(passed), 'passed')
puts result(names(failed), 'failed')