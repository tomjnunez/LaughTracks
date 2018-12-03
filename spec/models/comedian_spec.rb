RSpec.describe Comedian do
  describe 'Validations' do

    describe 'Required Field(s)' do

      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end


      it 'should be invalid if missing a city' do
        comic = Comedian.create(name: 'Mitch Hedberg', age:48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing a image_url' do
        comic = Comedian.create(name: 'Mitch Hedberg', age:48, city:'Houston, TX')
        expect(comic).to_not be_valid
      end

    end

  end

  describe 'Model Relationships' do

    it 'Comedian should have many Specials' do
      association = described_class.reflect_on_association (:specials)
      expect(association.macro).to eq :has_many
    end

  end
end
