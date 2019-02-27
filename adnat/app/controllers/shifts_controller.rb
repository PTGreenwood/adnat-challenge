class ShiftsController < ApplicationController

    def index
        @shifts = Shift.all
        #Can require 'json' instead.
        @organisation = Organisation.find(ActiveSupport::JSON.decode(params[:organisation_id]))
        @shift = Shift.new
    end 

    def show
        @organisation = Organisation.find(params[:organisation_id])
    end 

    def create
        #"shift"=>{"shift_date"=>"02/28/2019", "start_time"=>"9:00am", "end_time"=>"5:00pm", "break_length"=>"30"}, "commit"=>"Update"}
        @shifts = Shift.new()

        @start_time = remove_trailing_time(params[:shift][:start_time])
        @end_time = remove_trailing_time(params[:shift][:end_time])
        print("Start time: #{@start_time.inspect} and #{@end_time.inspect}")

        #if @shifts.save
        #    flash[:notice] = "Success! New Organisation Created"
        #    redirect_to index
        #else 
        #    flash[:alert] = "Error on Organisation Creation. Check if a field is blank"
        #    redirect_to index
        #end 
    end

    # Create Strict requirements for what is entered into the model
    # and ultimately the Database
    private
    def shifts_params
        #params.require(:shift).permit(:shift_date, :start_time, :end_time, :break_length)
    end

    # Removes trailing am/pm returns array with time + am/pm
    private 
    def remove_trailing_time(given_time)
        if given_time.downcase().include? "am"
            return [given_time.downcase().split(/am/), 'am']
        elsif given_time.downcase().include? "pm"
            return [given_time.downcase().split(/pm/), 'pm']
        else 
            return false
        end
    end 
end
