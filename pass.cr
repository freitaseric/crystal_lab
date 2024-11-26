chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a + %w(! @ # $ % ^ & *)

print "Password Length: "
input = gets
length = (input && !input.strip.empty?) ? input.strip.to_i : 8

password = Array.new(length) { chars.sample }.join

puts "Your super secure password is: #{password}"
