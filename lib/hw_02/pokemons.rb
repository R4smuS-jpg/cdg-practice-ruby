def pokemons_array
  puts 'Enter amount of pokemons you want to add:'
  pokemons_amount = $stdin.gets.encode('UTF-8').chomp.to_i

  result = []

  pokemons_amount.times do |t|
    puts "Enter pokemon number #{t+1} name: "
    pokemon_name = $stdin.gets.encode('UTF-8').chomp

    puts "Enter pokemon number #{t+1} color: "
    pokemon_color = $stdin.gets.encode('UTF-8').chomp

    puts '--------------------------'

    result << {name: pokemon_name, color: pokemon_color}
  end

  p result
end
