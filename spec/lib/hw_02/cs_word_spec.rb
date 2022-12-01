RSpec.describe 'cs_word method' do
  it 'prints 2**word.length if word ends with "cs"' do
    word = 'wordcs'
    expect { cs_word(word) }.to output("#{2**word.length}\n").to_stdout
  end

  it 'prints word backwards if word does not end with "cs"' do
    word = 'apple'
    expect { cs_word(word) }.to output("#{word.reverse}\n").to_stdout
  end
end
