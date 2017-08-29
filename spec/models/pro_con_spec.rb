require 'rails_helper'

RSpec.describe ProCon, type: :model do
  describe 'validations' do 

  	it 'requires a decision upon creation' do 
  		pro_con = build(:pro_con, decision: nil)

  		expect(pro_con.valid?).to eq(false) 
  		expect(pro_con.errors.full_messages).to eq(['Decision must exist'])
  	end

  	it 'must have a category of either "pro" or "con"' do 
  	pro_con = build(:pro_con, category: "blah", weight: 1 )

      expect(pro_con.valid?).to equal(false)
      expect(pro_con.errors.full_messages).to eq([
        "Category is not included in the list"
        ])

  	end
  end

  describe 'relationships' do 

  	it 'belongs to a decision' do 
  		  pro_con = create(:pro_con) 
        expect(pro_con.decision).not_to eq(nil)
        expect(pro_con.decision.id).not_to eq(nil)


  	end


  end

  

end
