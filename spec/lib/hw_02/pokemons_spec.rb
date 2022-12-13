RSpec.describe 'pokemons_array method' do
  let(:pokemon1) { {name: 'Pukachu', color: 'Yellow'} }
  let(:pokemon2) { {name: 'Charizard', color: 'Orange'} }

  it "prints all added pokemons" do
    correct_output = "Enter amount of pokemons you want to add:\n" \
                     "Enter pokemon number 1 name: \n" \
                     "Enter pokemon number 1 color: \n" \
                     "--------------------------\n" \
                     "Enter pokemon number 2 name: \n" \
                     "Enter pokemon number 2 color: \n" \
                     "--------------------------\n" \
                     "#{[pokemon1, pokemon2]}\n"

    allow($stdin).to receive(:gets).and_return("2", pokemon1[:name], pokemon1[:color],
                                                    pokemon2[:name], pokemon2[:color])
    expect {pokemons_array }.to output(correct_output).to_stdout
  end
end
