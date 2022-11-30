RSpec.describe 'greeting method' do
  let(:name) { 'Vasya'}
  let(:surname) { 'Pupkin'}

  it 'prints correct output if age is < 18' do
    age = 10
    
    correct_output = "Ваше имя: " \
                     "Ваша фамилия: " \
                     "Ваш возраст: " \
                     "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано\n"

    allow($stdin).to receive(:gets).and_return("#{name}", "#{surname}", "#{age}")
    expect { greeting }.to output(correct_output).to_stdout
  end

  it 'prints correct output if age is >= 18' do
    age = 20
    
    correct_output = "Ваше имя: " \
                     "Ваша фамилия: " \
                     "Ваш возраст: " \
                     "Привет, #{name} #{surname}. Самое время заняться делом!\n"

    allow($stdin).to receive(:gets).and_return("#{name}", "#{surname}", "#{age}")
    expect { greeting }.to output(correct_output).to_stdout
  end
end
