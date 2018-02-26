class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :make_nmapscans_variable

  def make_nmapscans_variable
   @nmapscans = Nmapscan.all 
   @masscans = Masscan.all
  end
  
end
