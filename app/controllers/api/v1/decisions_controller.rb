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

  
   def create
   		@user = User.find_by(id: params[:user_id])
   		if @user.id == current_user.id
   			@decision = @user.decisions.new(decision_params)
   			if @decision.save
   				render '/decisions/decision.json.jbuilder', decision: @decision
   			else 
   				render json: {
   					errors: @decision.errors.full_messages
   				}, status: 500
   			end
   		else 
   			render json: {
   				errors: [
   					{message: "No permission to add decisions"}
   				]
   			}, status: 403
   		end

   end

   def update 
   		@user = User.find_by(id: params[:user_id])
   		if @user.id == current_user.id
   			@decision = @user.decisions.find_by(id: params[:id])
   			if @decision.update_attributes(decision_params) 
   				render 'decisions/decision.json.jbuilder', decision: @decision
   			else 
   				render json: {
   					errors: @decision.errors.full_messages
   				}, status: 500
   			end
   		else 
   			render json: {
   				errors: [
   					{message: "You don't have permission to edit"}
   				]
   			}, status: 403
   		end
   end

   def destroy
   		decision = Decision.find_by(id: params[:id])
   		if decision
   			decision.destroy
   			head :no_contnet
   		else
   			render json: {
   				errors: {
   					message: "Page not found"
   				}
   			}, status: 404
   		end

   end

  private 

    def decision_params 
      params.require(:user).permit(:title)
    end
    
end