produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  selected = []
  counter = 0
  array = hash.to_a
  
  loop do
    if array[counter][1] == 'Fruit'
      selected << array[counter]
    end
    counter += 1
    break if counter == hash.size  
  end
  
  p selected.to_h
end

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}