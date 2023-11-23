last_value = 10
synchronizer = 1 # variable to "synchronize" threads output

t1 = Thread.new do
  last_value.times do |i|
    while synchronizer%2 == 0
      Thread.pass # give way to other threads to work
    end
    puts "Thread 1: #{i+1}"
    synchronizer+=1
  end
end

t2 = Thread.new do
  last_value.times do |i|
    while synchronizer%2 != 0
      Thread.pass # give way to other threads to work
    end
    puts "Thread 2: #{i+1}"
    synchronizer+=1
  end
end

# Waiting for threads to finish
t1.join
t2.join