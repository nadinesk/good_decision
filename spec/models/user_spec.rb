require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do 

  	it 'requires an username, email, and password upon creation' do 
  		user = build(:user, email: nil, password: nil)

  		expect(user.valid?).to equal(false)
  		expect(user.errors.full_messages).to eq([
  			"Password can't be blank", 
  			"Email can't be blank"
  			])
  	end


  	it 'requires than an email is unique'

  end

  describe 'on save' do 

  	it 'hashes a password'

  end


  describe 'relationships' do 

  	it 'has many decisions'

  end


end
