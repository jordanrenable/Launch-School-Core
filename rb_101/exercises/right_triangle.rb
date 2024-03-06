def triangle(size, position = 1)
  line = 1
  size.times do
    case position
    when 1
      puts ('*' * line).rjust(size)
    when 2
      puts ('*' * line).ljust(size)
    when 3
      puts ('*' * (size - (line - 1))).rjust(size)
    when 4
      puts ('*' * (size - (line - 1))).ljust(size)
    end
    line += 1
  end
end

triangle(9)
triangle(5)
triangle(5, 2)
triangle(5, 3)
triangle(5, 4)
