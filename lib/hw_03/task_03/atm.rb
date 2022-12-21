def print_actions_menu
  puts 'D - deposit',
       'W - withdraw',
       'B - balance',
       'M - menu'
       'Q - quit',
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

print_actions_menu

loop do
  puts '-----------------------------'

  action = $stdin.gets.encode('UTF-8').chomp.downcase.to_sym

  case action
  when :d
    print 'Enter amount of money to deposit: '
    amount_of_money = $stdin.gets.encode('UTF-8').to_f
    deposit(amount_of_money)
    print_current_balance
  when :w
    print 'Enter amount of money to withdraw: '
    amount_of_money = $stdin.gets.encode('UTF-8').to_f
    withdraw(amount_of_money)
    print_current_balance
  when :b
    print_current_balance
  when :m
    print_actions_menu
  when :q
    break
  else
    puts 'Incorrect action!'
  end
end
