# frozen_string_literal: true

require_relative '../lib/caesar_cipher'

describe '#caesar_cipher' do
  it 'allow special characters' do
    expect(caesar_cipher('?What a string!', 5)).to eql('?Bmfy f xywnsl!')
  end

  it 'maintain case' do
    expect(caesar_cipher('WhaT a STring!', 5)).to eql('BmfY f XYwnsl!')
  end

  it 'wrap around at z' do
    expect(caesar_cipher('WhaZ a STring!', 5)).to eql('BmfE f XYwnsl!')
  end
end
