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

  	it 'has many pro_cons' do
  		
  		decision = create(:decision)

  		decision.pro_cons.create

  		expect(decision.pro_cons.first.id).not_to eq(nil)
  		
  	end

  	

  end

  describe 'instance methods' do 


  	 it "calculates the total of the pros and con weights by subtracting the total of the cons' weights from the total of the pros' weights" do 
        
        decision = create(:decision)
        pro_con1 = build(:pro_con, category: 'pro', weight: 5, decision: decision)
        pro_con2 = build(:pro_con, category: 'pro', weight: 4, decision: decision)
        pro_con3 = build(:pro_con, category: 'con', weight: 3, decision: decision)
        pro_con4 = build(:pro_con, category: 'con', weight: 2, decision: decision)
    		
        decision.pro_cons << pro_con1     
		    decision.pro_cons << pro_con2    
		    decision.pro_cons << pro_con3    

        expect(decision.total).to eq(6)
		
		    decision.pro_cons << pro_con4   
        
        expect(decision.total).to eq(4)
      end

  end




  


end
