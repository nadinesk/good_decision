class Api::V1::DecisionsController < ApplicationController 
  
    before_action :authenicate_token!, only [:create, :update, :destroy]

   def index
       @decisions = User.find_by(id: params[:user_id])&.decisions
    	render 'decisions/decisions.json.jbuilder', decisions: @decisions
   end
          

   def show
   		@decision = Decision.find_by(id: params[:id])
   		if @decision 
   			render 'decisions/decision.json.jbuilder', decision: @decision
   		else 
   			render json: {
   				errors: {
   					message: "Page not found"
   				}
   			}, status: 404
   		end
      
   end



   
    

end