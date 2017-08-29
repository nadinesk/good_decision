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

  describe 'instance methods' do 

  	 it "calculates the total of the pros and con weights" do 
        # pro_con1 = build(:pro_con, type: 'pro', weight: "10.99")
        # item2 = build(:item, price: "10.99")
        # item3 = build(:item, price: "11.99")
        # @cart.items << item1
        # @cart.items << item2 

        # expect(@cart.total).to eq(21.98)

        # @cart.items << item3
        # expect(@cart.total).to eq(33.97)
     end

  end


end
