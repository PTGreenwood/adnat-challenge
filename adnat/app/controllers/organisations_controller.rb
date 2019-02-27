class OrganisationsController < ApplicationController

    #Display all Organisations
    def index
        @organisation = Organisation.all
        @creationOrganisation = Organisation.new
        #@organisation = Organisation.find(16)
    end

    #Initial Creation of new organisation for form.
    def new
        @organisation = Organisation.new
    end

    #Display Organisation by given ID Paramater
    def show
        @organisation = Organisation.find(params[:id])
    end 

    #Edit an existing organisation
    def edit
        @organisation = Organisation.find(params[:id])
    end

    #Create and Join a new Organisation
    #TODO: Automatically Join new Organisation
    def create
        @organisation = Organisation.new(organisation_params)
        
        if @organisation.save
            flash[:notice] = "Success! New Organisation Created"
            redirect_to index
        else 
            flash[:alert] = "Error on Organisation Creation. Check if a field is blank"
            redirect_to index
        end 
    end

    #Update the model through PATCH call. Called from Edit.html.erb
    def update
        @organisation = Organisation.find(params[:id])

        if @organisation.update(organisation_params)
            flash[:notice] = "Success! Organisation Updated"
            redirect_to @organisation
        else
            render 'edit'
        end
    end

    def destroy
        @organisation = Organisation.find(params[:id])
        if @organisation.destroy
            flash[:notice] = "Organisation Removed"
            render 'new'
        else
            redirect_to organisation_path
        end 
    end
    # Create Strict requirements for what is entered into the model
    # and ultimately the Database
    private
    def organisation_params
        params.require(:organisation).permit(:name, :hourly_rate)
    end


end
