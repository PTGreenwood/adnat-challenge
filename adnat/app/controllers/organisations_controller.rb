class OrganisationsController < ApplicationController

    #Display all Organisations
    def index
        @organisation = Organisation.all
    end

    #Initial Creation of new organisation for form.
    def new
        @organisation = Organisation.new
    end

    #Display Organisation by given ID Paramater
    def show
        @organisation = Organisation.find(params[:id])
    end 

    #Create and Join a new Organisation
    #TODO: Automatically Join new Organisation
    def create
        @organisation = Organisation.new(organisation_params)
        
        if @organisation.save
            flash[:notice] = "Success! New Organisation Created"
            redirect_to @organisation
        else 
            render 'new'
        end 
    end

    # Create Strict requirements for what is entered into the model
    # and ultimately the Database
    private
    def organisation_params
        params.require(:organisation).permit(:name, :hourly_rate)
    end


end
