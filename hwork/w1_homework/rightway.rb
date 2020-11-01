t = Time.now
hour = t.strftime("%H").to_i

if hour < 6
	puts "Your current time is #{t.strftime("%H : %M")} Zzzz"
elsif hour > 5 && hour < 12
	puts "Your current time is #{t.strftime("%H : %M")} Good Morning"
elsif hour > 11 && hour < 18
	puts "Your current time is #{t.strftime("%H : %M")} Good Afternoon"
else
	puts "Your current time is #{t.strftime("%H : %M")} Good Evening"
end