RSpec.describe Special do
  describe 'Validations' do

    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        special = Special.create
        expect(special).to_not be_valid
      end
      it 'should be invalid if missing a length' do
        special = Special.create(name:"Steve")
        expect(special).to_not be_valid
      end
      it 'should be invalid if missing a comedian_id' do
        special = Special.create(name:"Marvin", length:6)
        expect(special).to_not be_valid
      end
    end

  end

  describe 'Model Relationships' do

    it 'Should belong to one Comedian' do
      association = described_class.reflect_on_association (:comedian)
      expect(association.macro).to eq :belongs_to
    end

  end
end
