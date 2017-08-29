require 'rails_helper'

RSpec.describe Decision, type: :model do
  describe 'validations' do 

  	it 'requires a user upon creation' do 
  		decision = build(:decision, user: nil)

  		expect(decision.valid?).to eq(false) 
  		expect(decision.errors.full_messages).to eq(['User must exist'])
  	end



  end


  describe 'relationships' do 

  	it 'belongs to a user' do 
  		decision = create(:decision) 

  		expect(decision.user).not_to eq(nil)
  		expect(decision.user.id).not_to eq(nil)

  	end

  end
  


end
