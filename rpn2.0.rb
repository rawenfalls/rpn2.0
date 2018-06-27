expression = gets.chomp.strip.scan(/\S/)
output=[]
operands=[]


expression.each do |the_element_of_expression|
  case the_element_of_expression
    when /[\+\-\*\/\^\(\)]+/
      operands<<the_element_of_expression
      if operands[1]!=nil
        if operands[-1] == operands[-2] and operands[-1] != "(" and operands[-1] != ")"
          output<<operands.delete_at(-2)
        end
        if operands[-1] == ")"
          operands.delete_at(-1)
          output<<operands.delete_at(-1)
          operands.delete_at(-1)
          output<<operands.delete_at(-1)
        end
      end
    else
      output<<the_element_of_expression
  end
end
operands.delete("(")
operands.delete(")")
output<<operands
puts output.join("")
