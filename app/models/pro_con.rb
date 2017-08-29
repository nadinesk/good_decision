class ProCon < ApplicationRecord
  
  belongs_to :decision

  validates :category,
  	:inclusion => { :in => ['pro', 'con']}
  
end
