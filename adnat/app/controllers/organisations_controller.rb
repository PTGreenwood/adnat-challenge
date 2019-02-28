class OrganisationsController < ApplicationController

    #Display all Organisations
    def index
        if(current_user.organisation_id.nil?)
            @organisation = Organisation.all
        else 
            @organisation = Organisation.find(current_user.organisation_id)
        end 

        @creationOrganisation = Organisation.new
    end

    #Initial Creation of new organisation for form.
    def new
        @organisation = Organisation.new
    end


    #Display Organisation by given ID Paramater
    def show
        if check_validity(params[:id])
            @organisation = Organisation.find(params[:id])
        end
    end 

    #Edit an existing organisation
    def edit
        if check_validity(params[:id])
            @organisation = Organisation.find(params[:id])
        end
    end

    #Create and Join a new Organisation
    def create
        @organisation = Organisation.new(organisation_params)
        
        if @organisation.save
            flash[:notice] = "Success! New Organisation Created"
            redirect_to "/organisations/join/#{@organisation.id}"
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

    # Destroy Organisation with given ID.
    # Note: Currently no link to destory an organisation. This would be another feature with
    # CANCAN for permissions. Only the creator of the organisation can delete.
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

    # DRYING up some code
    # Checks validity of an organisation. If it doesn't exist. Will just redirect
    private
    def check_validity(id)
        begin
            Organisation.find(id)
            return true
        rescue
            print "Bad Organisation ID - Redirecting \n"
            redirect_to organisations_path
            return false
        end 
    end


end
