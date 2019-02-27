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
end
