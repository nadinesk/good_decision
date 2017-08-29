class Decision < ApplicationRecord
  belongs_to :user
  has_many :pro_cons

  def total 
  	t = 0
   	self.pro_cons.each do |pro_con|
   		if pro_con.category == 'pro'    			
   			t += pro_con.weight   			
   		elsif pro_con.category == 'con'
   			t -= pro_con.weight
   		else
   			t += 0
   		end
   	end
   	return t; 
  end
  
end
