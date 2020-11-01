require 'json'
file = File.read('grades.json')
data_hash = JSON.parse(file)

sum = 0
data_hash.map { |e| sum += e["grade"] }
mean = sum / data_hash.size
puts "Avarage grade is #{mean}"

pass_length = data_hash.select { |grad| grad["grade"] >= mean }.size
fail_length = data_hash.select { |grad| grad["grade"] < mean }.size

pass_count = 1
fail_count = 1

data_hash.each do |grad|
    if grad["grade"] >= mean && pass_count <= pass_length
        if pass_count < pass_length - 1
            print "#{grad["name"]}, "
        end
        pass_count += 1
    end

    if grad["grade"] >= mean && pass_count == pass_length
        print "#{grad["name"]} and"
        pass_count += 1
    elsif grad["grade"] >= mean && pass_count == pass_length + 1
        puts " #{grad["name"]} are passed"
        pass_count += 1
    end
end

data_hash.each do |grad|
    if grad["grade"] < mean && fail_count <= fail_length
        if fail_count < fail_length - 1
            print "#{grad["name"]}, "
        end
        fail_count += 1
    end

    if grad["grade"] < mean && fail_count == fail_length
        print "#{grad["name"]} and"
        fail_count += 1
    elsif grad["grade"] < mean && fail_count == fail_length + 1
        puts " #{grad["name"]} are failed"
        fail_count += 1
    end
end