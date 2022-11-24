RSpec.describe 'foobar method' do
  let(:num1) { 20 }
  let(:num2) { 20 }

  it 'works correct if both numbers is 20' do
    expect(foobar(num1, num2)).to eq(num2)
  end           

  it 'works correct if only num1 is 20' do
    num2 = 10

    expect(foobar(num1, num2)).to eq(num2)
  end

  it 'works correct if only num2 is 20' do
    num1 = 10

    expect(foobar(num1, num2)).to eq(num2)
  end

  it 'works correct if none of numbers is 20' do
    num1 = 10
    num2 = 10

    expect { foobar(num1, num2) }.to output("#{num1 + num2}\n").to_stdout
  end
end
