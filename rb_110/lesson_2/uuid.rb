def create_uuid
  bank = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0)
  uuid = ''
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |num, ind|
    num.times do |_| 
      uuid << bank.sample
    end
    uuid << '-' if (ind + 1) < sections.size
  end
  uuid
end

puts create_uuid