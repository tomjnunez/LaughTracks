RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 57)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg', age: 57)
        expect(comic).to_not be_valid
      end

      it 'should be valid with correct params' do
        comic = Comedian.create(name: 'Mitch Hedberg', age: 57, city:'Harrisburg')
        expect(comic).to be_valid
      end

      it "can have many specials" do
        association = Comedian.reflect_on_association(:specials)
        expect(association.macro).to eq :has_many
      end
    end
  end

  describe 'Class Methods' do
    it 'can calculate average age of all comedians' do
      comic = Comedian.create(name: 'Mitch Hedberg', age: 20, city:'Harrisburg')
      comic = Comedian.create(name: 'Mitch Hedberg', age: 40, city:'Harrisburg')
      actual = Comedian.average_age
      expect(actual).to eq 30
      comic = Comedian.create(name: 'Mitch Hedberg', age: 60, city:'Harrisburg')
      actual = Comedian.average_age
      expect(actual).to eq 40
    end
  end
end
