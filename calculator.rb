def say(msg)
  puts "=> #{msg}"
end

operator_values = ["1", "2", "3", "4"]

say "Please enter your first number:"
num1 = gets.chomp

say "Please enter your second number:"
num2 = gets.chomp

say "Please enter 1 to add, 2 to subtract, 3 to multiply or 4 to divide your numbers:"
operator = gets.chomp

until operator_values.include?(operator)
  say "Please enter a number between 1 and 4 (1 to add, 2 to subtract, 3 to multiply or 4 to divide):"
  operator = gets.chomp
end

case operator
  when "1"
    result = num1.to_i + num2.to_i
  when "2"
    result = num1.to_i - num2.to_i
  when "3"
    result = num1.to_i * num2.to_i
  when "4"
    result = num1.to_f / num2.to_f
end

puts "The answer is #{result}."

    