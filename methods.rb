def greeting
  print 'Ваше имя: '
  name = $stdin.gets.encode('UTF-8').chomp

  print 'Ваша фамилия: '
  surname = $stdin.gets.encode('UTF-8').chomp

  print 'Ваш возраст: '
  age = $stdin.gets.encode('UTF-8').chomp.to_i

  if age < 18
    puts "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  else
    puts "Привет, #{name} #{surname}. Самое время заняться делом!"
  end
end

def foobar(a, b)
  if a == 20 || b == 20
    b
  else
    puts a + b
  end
end
