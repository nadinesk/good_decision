class Decision < ApplicationRecord
  belongs_to :user
  has_many :pro_cons
  
end
