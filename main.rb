last_value = 10
value = 1 # output value

# Will output odd numbers from 1 to last_value
t1 = Thread.new do
  iteration = last_value/2
  iteration += 1 if last_value % 2 != 0 # extra iteration if last value is odd
  (iteration).times do
    while value%2 == 0
      Thread.pass # give way to other threads to work
    end
    puts "Thread 1: #{value}"
    value+=1
  end
end

# Will output even numbers from 2 to last_value
t2 = Thread.new do
  (last_value/2).times do
    while value%2 != 0
      Thread.pass # give way to other threads to work
    end
    puts "Thread 2: #{value}"
    value+=1
  end
end

# Waiting for threads to finish
t1.join
t2.join
