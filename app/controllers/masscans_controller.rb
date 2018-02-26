class MasscansController < ApplicationController
  def index
    @masscans = Masscan.all
  end
  
  def new
  end
  
  def create
    def create
      render plain: params[:masscan].inspect
    end
=begin
    @masscan = Masscan.new(masscan_params)
    
    respond_to do |format|
      if @masscan.save
        NmapScanJob.perform_later(@masscan)
        format.html {redirect_to masscans_path, notice: 'Scan is running in the background'}
        #format.html { redirect_to @masscan, notice: 'Item was successfully created.' }
        format.json { render json: @masscan, status: :created, location: @masscan }
      else
        format.html { render action: "new", notice: "'#{@masscan.errors}" }
        format.json { render json: @masscan.errors, status: :unprocessable_entity }
      end
    end
=end
    
  end
  
  def show
        @masscan = Masscan.find(params[:id])
  end
  
  def destroy
  end
  
  private
    def masscan_params
      params.require(:masscan).permit(:filename, :target, :rate, :mac)
    end
  
end
