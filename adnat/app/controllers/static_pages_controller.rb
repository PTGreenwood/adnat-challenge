class StaticPagesController < ApplicationController

  # Main page for login/register
  def index
    if user_signed_in?
      redirect_to organisations_path
    end 
  end

end
