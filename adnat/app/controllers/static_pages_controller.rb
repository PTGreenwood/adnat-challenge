class StaticPagesController < ApplicationController

  def index
    if user_signed_in?
      redirect_to organisations_path
    end 
  end

end
