class NmapscansController < ApplicationController

  def show
    @scan = Nmapscan.find(params[:id])
  end
  
  def new
  end

  def create
  	render plain: params[:nmapscan].inspect
    
    @scan = Nmapscan.new(nmapscan_params)
        
    @scan.save
    redirect_to @scan
  end
  

  
  private
    def nmapscan_params
      params.require(:nmapscan).permit(:filename, :target, :port, :vuln, :safe, :os, :service_version, :fragment, :speed, :ping)
    end
end
