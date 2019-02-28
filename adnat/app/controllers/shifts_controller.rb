class ShiftsController < ApplicationController
    require 'date'
    require 'time'

    # Main Index Page - Where all the magic happens for Shifts.
    # Flexible implementation allows an organisation to be accessed and a shift added to that
    # organisation. 
    # Note: Keeping it this way to allow expansion of features for users to be a part of multiple organisations
    def index
        begin
            @shifts = Shift.all
            #Can require 'json' instead.
            @organisation = Organisation.find(ActiveSupport::JSON.decode(params[:organisation_id]))
            @shift = Shift.new

            # Redirection if User is not a part of the entered organisation.
            begin
                @organisation.users.find(current_user.id)
            rescue
                print "User is not in this organisation - Redirecting"
                redirect_to organisations_path
            end
        rescue
            print "Something went wrong. Possibly wrong organisation id given. Redirecting"
            redirect_to organisations_path
        end 
    end 

    # Show a Single Shift for an organisation. 
    # Unused - Keeping here for consistency.
    def show
        begin
            @organisation = Organisation.find(params[:organisation_id])
        rescue
            print "Bad Organisation ID"
            redirect_to organisations_path
        end 
    end 

    #Edit an existing shift
    def edit
        if check_validity(params[:id])
            @shift = Shift.find(params[:id])
        end
    end

    #Update the model through PATCH call. Called from Edit.html.erb
    #Unsure of best practice here.
    def update
        begin
            @shift = Shift.find(params[:id])

            start_shift_date = params[:shift][:shift_date].to_s.dup
            end_shift_date = params[:shift][:shift_date].to_s.dup
            #Join Shift_date + Start_time together.
            start_time = start_shift_date.concat(' ').concat(params[:shift][:start_time].to_s)
            
            #Join Shift_date + End_time together.
            end_time = end_shift_date.concat(' ').concat(params[:shift][:finish_time].to_s) #Duplicate due to shift date being concat

            if @shift.update(
                :start => DateTime.strptime(start_time, "%m/%d/%Y %H:%M%p"), 
                :finish => DateTime.strptime(end_time, "%m/%d/%Y %H:%M%p"),
                :breaklength => params[:shift][:break_length],
                :user_id => current_user.id)
                print("start: #{@shift.start}")
                flash[:notice] = "Success! Organisation Updated"
                redirect_to organisations_path
            else
                render 'edit'
            end
        rescue
            flash[:alert] = "Error on Shift Creation. Check Entry and Try again"
            render 'edit'
        end
    end
    
    # Handles creation of the shift. Due to nature of dates and times. They are manually
    # constructed and saved within the shifts model
    # Note: Finish time is also Datetime - allows for future expansion of features where
    # end time might finish on a separate date.
    def create
        @shifts = Shift.new()
        start_shift_date = params[:shift][:shift_date].to_s.dup
        end_shift_date = params[:shift][:shift_date].to_s.dup
        
        begin
            #Join Shift_date + Start_time together.
            start_time = start_shift_date.concat(' ').concat(params[:shift][:start_time].to_s)
            
            #Join Shift_date + End_time together.
            end_time = end_shift_date.concat(' ').concat(params[:shift][:end_time].to_s) #Duplicate due to shift date being concat
            
            @shifts.start = DateTime.strptime(start_time, "%m/%d/%Y %H:%M%p")
            @shifts.finish = DateTime.strptime(end_time, "%m/%d/%Y %H:%M%p")
            @shifts.breaklength = params[:shift][:break_length]

            @shifts.user_id = current_user.id

            if @shifts.save
                flash[:notice] = "Success! New Shift Saved"
                redirect_to organisations_path
            else 
                flash[:alert] = "Error on Shift Creation. Check Entry and Try again"
                redirect_to organisations_path
            end 

        rescue
            flash[:alert] = "Error on Shift Creation. Check Entry and Try again"
            redirect_to organisations_path
        end
    end

    # DRYING up some code
    # Checks validity of an organisation. If it doesn't exist. Will just redirect
    private
    def check_validity(id)
        begin
            Shift.find(id)
            return true
        rescue
            print "Bad Shift ID - Redirecting \n"
            redirect_to organisations_path
            return false
        end 
    end
end
