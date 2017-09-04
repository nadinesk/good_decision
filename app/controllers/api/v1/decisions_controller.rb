class Api::V1::DecisionsController < ApplicationController 
  
 
  

   def index

	    @decisions = User.find_by(id: params[:user_id])&.decisions
    	render 'decisions/decisions.json.jbuilder', decisions: @decisions

  end

   
    

end