GAMES_PATH = './data.txt'
BUFFER_PATH = './buffer.txt'

def index
  File.foreach(GAMES_PATH).with_index do |game, index|
    puts "#{index}. #{game}"
  end
end

def create(game)
  file = File.open(GAMES_PATH, 'a:UTF-8')
  file.puts(game)
  file.close
end

def find(id)
  File.foreach(GAMES_PATH).with_index do |game, index|
    return game if index == id
  end
end

def where(name)
  File.foreach(GAMES_PATH).with_index do |game, index|
    return index if game.downcase.include?(name.downcase)
  end
end

def update(id, name)
  buffer_file = File.open(BUFFER_PATH, 'w:UTF-8')
  File.foreach(GAMES_PATH).with_index do |game, index|
    buffer_file.puts(id == index ? name : game)
  end

  buffer_file.close
  File.write(GAMES_PATH, File.read(BUFFER_PATH))
  File.delete(BUFFER_PATH) if File.exist?(BUFFER_PATH)
end

def delete(id)
  buffer_file = File.open(BUFFER_PATH, 'w:UTF-8')
  File.foreach(GAMES_PATH).with_index do |game, index|
    buffer_file.puts(game) if index != id
  end

  buffer_file.close
  File.write(GAMES_PATH, File.read(BUFFER_PATH))
  File.delete(BUFFER_PATH) if File.exist?(BUFFER_PATH)
end
