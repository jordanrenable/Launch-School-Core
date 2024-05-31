=begin
Problem
given a number which represents a series of lightswitches
the toggle is initially set to off
on first iteration, toggle each 1
on second iteration toggle each 2nd switch
third, each 3rd switch
etc

input- integer (n) representing the number of switches
output- an array which represents the switches toggled to "ON" after n iterations

Examples

lights_on(5) == [1, 4]
lights_on(10) == [1, 4, 9]

1 2 3 4 5
F F F F F

[T T T T T]
T F T F T
T F F F T
T F F T T
T F F T F

Data Structures
input- integer
array of booleans representing each switch

output- array

Algorithm
create subarray
  given a number, build an array with that many elements, each of which are set to false

Loop over entire subarray n number of times (to select and change approproiate lights)
  keep track of which iteration with a counter
  Loop over elements in the subarray and change qualifying ones
    on each iteration toggle the switches at multiples of |iteration|
    if the switch is true, set to false, else true
    increment the counter by 1
    stop when counter exceeds n

Select by index the ones that are on
      evaluate the array, create a new array consisting of the index numbers which are set to true



     1 2 3 4 5
     is index + 1 evenly divisble by iteration? 



up to number of switches, 
=end





def lights_on(switches)
  array = []
  switches.times { |_| array << false }
  row_counter = 1

  switches.times do |iteration|
    el_counter = 1

    array.map! do |switch|
      if el_counter % row_counter == 0
        switch = !switch
      end
      
      el_counter += 1
      switch
    end
    row_counter += 1
  end
  on_switches = []
  array.each_with_index do |switch, index|
    on_switches << index + 1 if switch == true
  end
  on_switches
end

p lights_on(1000)


def joinand(arr, delimiter=', ', word='and')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

puts "Lights #{joinand(lights_on(1000))} are on."