class UsersController < ApplicationController

    #Join the specified organisation
    def join
        @organisation = Organisation.find(params[:id])
        print ("Current users id: #{current_user.id}")
        current_user.organisation_id = @organisation.id
        current_user.save   
        redirect_to '/'
    end 

    #Leave a given organisation
    def leave
        current_user.organisation_id = nil
        current_user.save
        redirect_to '/'
    end 

    private
    def user_params
        params.require(:user).permit(:id, :name, :email)
    end

end
