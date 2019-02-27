class UsersController < ApplicationController

    def join
        @organisation = Organisation.find(params[:id])
        print ("Current users id: #{current_user.id}")
        current_user.organisation_id = @organisation.id
        current_user.save
        
        redirect_to index
    end 

    private
    def user_params
        params.require(:user).permit(:id, :name, :email)
    end

end
