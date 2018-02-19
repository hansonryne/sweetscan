class NmapscansController < ApplicationController

  def index
    @nmapscans = Nmapscan.all
  end
  
  def show
    @nmapscan = Nmapscan.find(params[:id])
    render file: "public/nmapscans/#{@nmapscan.filename}"
  end
  
  def new
    @nmapscan = Nmapscan.new
  end

  def create    
    @nmapscan = Nmapscan.new(nmapscan_params)
        
    respond_to do |format|
      if @nmapscan.save
        format.html { redirect_to @nmapscan, notice: 'Item was successfully created.' }
        format.json { render json: @nmapscan, status: :created, location: @nmapscan }
      else
        format.html { render action: "new", notice: "'#{@nmapscan.errors}" }
        format.json { render json: @nmapscan.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @nmapscan = Nmapscan.find(params[:id])
    @nmapscan.destroy
 
    redirect_to nmapscans_path
  end
  
  private
    def nmapscan_params
      params.require(:nmapscan).permit(:filename, :target, :port, :vuln, :safe, :os, :service_version, :fragment, :speed, :ping)
    end
end
