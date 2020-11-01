t = Time.now
hour = Time.now.hour

message = if hour < 06
	'Zzzz'
elsif hour > 05 && hour < 12
	'Good Morning'
elsif hour > 11 && hour < 18
	'Good Afternoon'
else
	'Good Evening'
end

puts "Your current time is #{t.strftime("%H : %M")} #{message}"