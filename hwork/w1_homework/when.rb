t = Time.now
hour = Time.now.hour

your_time = case hour
when 00..05
	'Zzzz'
when 06..11
	'Good Morning'
when 12..17
	'Good Afternoon'
else
	'Good Evening'
end

puts "Your current time is #{t.strftime("%H : %M")} #{your_time}"