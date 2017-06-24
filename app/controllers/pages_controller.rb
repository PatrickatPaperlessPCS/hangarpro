class PagesController < ApplicationController
  before_action :authenticate_user!  
  def home
    if current_user.admin == true
      redirect_to hangars_path
    else
    redirect_to pages_information_path
    end
  end
end
