class WelcomeController < ApplicationController
  def index
    @nmapscans = Nmapscan.all
  end
end
