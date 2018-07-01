expression = gets.chomp.strip.scan(/\S/)
output=[]
operands=[]
priority = {"+" => 1, "-" => 1, "*" => 2, "/" => 2, "^" => 3}


expression.each do |the_element_of_expression|
  case the_element_of_expression
    when /[\+\-\*\/\^\(\)]+/
      operands<<the_element_of_expression
      if operands[1]!=nil
        if operands[-1] != "(" and operands[-1] != ")" and operands[-2] != "("
          if priority[operands[-1]] <= priority[operands[-2]]
            output<<operands.delete_at(-2)
          end
        end
        if operands[-1] == ")"
          operands.pop
          loop do
            break if operands[-1]=="("
            output<<operands.pop
          end
          operands.pop
        end
      end
    else
      output<<the_element_of_expression
  end
end
operands.delete("(")
operands.delete(")")
loop do
  break if operands[0]==nil
  output<<operands.pop
end
puts output.join("")