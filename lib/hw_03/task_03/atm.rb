def print_actions_menu
  puts 'D - deposit',
       'W - withdraw',
       'B - balance',
       'Q - quit'
end

def print_current_balance
  puts "Current balance: #{@balance}"  
end

def deposit(amount_of_money)
  @balance += amount_of_money
  File.write(BALANCE_PATH, @balance)
end

def withdraw(amount_of_money)
  @balance -= amount_of_money
  File.write(BALANCE_PATH, @balance)
end

BALANCE_PATH = './balance.txt'
@balance = File.exist?(BALANCE_PATH) ? File.read(BALANCE_PATH).to_f : 100.0

loop do
  print_actions_menu
  separator = '-----------------------------'
  puts separator

  action = $stdin.gets.encode('UTF-8').chomp.downcase.to_sym

  case action
  when :d
    print 'Enter amount of money to deposit: '
    amount_of_money = $stdin.gets.encode('UTF-8').to_f

    if amount_of_money < 0
      puts 'Incorrect value!'
      puts separator
      next
    end

    deposit(amount_of_money)
    print_current_balance
    puts separator
  when :w
    print 'Enter amount of money to withdraw: '
    amount_of_money = $stdin.gets.encode('UTF-8').to_f

    if amount_of_money < 0 || amount_of_money > @balance
      puts 'Incorrect value!'
      puts separator
      next
    end

    withdraw(amount_of_money)
    print_current_balance
    puts separator
  when :b
    print_current_balance
    puts separator
  when :q
    break
  else
    puts 'Incorrect action!'
  end
end
