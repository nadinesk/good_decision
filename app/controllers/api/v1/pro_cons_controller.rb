class Api::V1::ProConsController < ApplicationController 

  before_action :authenticate_token!, only: [:create, :update, :destroy]
  
  def index
    @pro_cons = Decision.find_by(id: params[:decision_id])&.pro_cons
    if @pro_cons
      render 'pro_cons/pro_cons.json.jbuilder', pro_cons: @pro_cons
    end
   end

  def show
    @pro_con = ProCon.find_by(id: params[:id])
    if @pro_con 
      render 'pro_cons/pro_con.json.jbuilder', pro_con: @pro_con
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
   		@decision = Decision.find(params[:decision_id])
	    @pro_con = @decision.pro_cons.build(pro_con_params)      
      
	    @pro_con.save	    	    
	     if @pro_con.save      
	       render '/pro_cons/pro_con.json.jbuilder', pro_con: @pro_con
	     else
	       render json: {
   					errors: @pro_con.errors.full_messages
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

   def destroy   
     pro_con = ProCon.find(params[:id])
      if pro_con
        pro_con.destroy
        head :no_contnet
      else
        render json: {
          errors: {
            message: "Page not found"
          }
        }, status: 404
      end

  end

  def update 
      @user = User.find_by(id: params[:user_id])
      if @user.id == current_user.id
        @pro_con = ProCon.find(params[:id])
        if @pro_con.update_attributes(pro_con_params) 
          render '/pro_cons/pro_con.json.jbuilder', pro_con: @pro_con
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

 
 	private 

    def pro_con_params 
      params.require(:pro_con).permit(:description, :category, :weight)
    end

   
  

   
end

 