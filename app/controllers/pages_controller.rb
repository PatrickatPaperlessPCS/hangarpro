class PagesController < ApplicationController
skip_before_action :logged_in
  def home
  end

  def owners_dashboard
  	@owners_hangars = Hangar.where(:owner_id => current_owner.id)
  end
end
