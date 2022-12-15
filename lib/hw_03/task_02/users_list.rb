USERS_PATH = './users.txt'
RESULTS_PATH = './results.txt'

def files_equal?(path_1, path_2)
  File.read(path_1).split("\n").sort == File.read(path_2).split("\n").sort
end

loop do
  results_file = File.open(RESULTS_PATH, 'a:UTF-8')

  if files_equal?(USERS_PATH, RESULTS_PATH)
    puts 'Files are equal'
    break
  end

  print 'Enter your age: '
  age = $stdin.gets.encode('UTF-8').chomp.to_i

  break if age == -1

  File.foreach(USERS_PATH) do |user_data|
    if user_data.split[2].to_i == age
      results_file.puts user_data
    end
  end

  results_file.close
end
