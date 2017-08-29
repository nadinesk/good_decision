require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do 

  	it 'requires an username, email, and password upon creation' do 
  		user = build(:user, email: nil, password: nil, username: nil)

  		expect(user.valid?).to equal(false)
  		expect(user.errors.full_messages).to eq([
  			"Password can't be blank",   			
  			"Email can't be blank", 
  			"Email is invalid", 
  			"Username can't be blank",
  			])
  	end


  	it 'requires than an email is unique' do 
  		create(:user)
  		user = build(:user)

  		expect(user.valid?).to equal(false)
  		expect(user.errors.full_messages).to eq([
  			"Email has already been taken"
  			
  			])
  	end


  	it 'requires that an email is valid (example: contains an @ symbol and a .com, .org, etc)' do 
  		user1 = build(:user, email: 'nadine.com')
  		user2 = build(:user, email: 'nadine@blahblah')
  		user3 = build(:user, email: 'nadine')

  		expect(user1.valid?).to equal(false)
  		expect(user1.errors.full_messages).to eq([
  			"Email is invalid"
  			])
  		expect(user2.valid?).to equal(false)
  		expect(user2.errors.full_messages).to eq([
  			"Email is invalid"
  			])
  		expect(user3.valid?).to equal(false)
  		expect(user3.errors.full_messages).to eq([
  			"Email is invalid"
  			])


  	end




  end

  describe 'on save' do 

  	it 'hashes a password' do 
  		user = build(:user) 
  		user.save

  		expect(user.password_digest).not_to equal(user.password)
  	end

  end


  describe 'relationships' do 

  	it 'has many decisions' do 

  		user = create(:user)
  		user.decisions.create

  		expect(user.decisions.first.id).not_to eq(nil)


  	end

  	


  end


end
