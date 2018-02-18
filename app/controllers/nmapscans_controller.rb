class NmapscansController < ApplicationController
  def new
  end

  def create
#  	render plain: params[:nmapscan].inspect
#=begin
  	command = "nmap "

  	if params[:nmapscan][:fragment].present? == true
  		command.concat("-f ")
  	end

  	if params[:nmapscan][:zombie].present? == true
  		command.concat("-sI  ")
  	end

  	if params[:nmapscan][:service_version].present? == true
  		command.concat("-sV ")
  	end

  	if params[:nmapscan][:os].present? == true
  		command.concat("-O ")
  	end

  	if params[:nmapscan][:safe].present? == true
  		command.concat("-sC ")
  	end

  	if params[:nmapscan][:vuln].present? == true
  		command.concat("--script vuln ")
  	end
    
    if not params[:nmapscan][:port] =~ /^.{1,5}$/
      flash[:notice] = "Your port is wrong"
      redirect_to "/nmapscans/new"
      return
    else
      command.concat("-p #{params[:nmapscan][:port]} ")
    end
    
    if not params[:nmapscan][:target] =~ /^(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\.(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\.(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\.(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])$/
      flash[:notice] = "Your IP is wrong."
      redirect_to "/nmapscans/new"
      return
    else
      command.concat("#{params[:nmapscan][:target]}")
  	end

    system "#{command} -oX test.xml > /dev/null"
    system "xsltproc test.xml -o results.html"
    render :file => "results.html"

    @scan = Nmapscan.new(params.require(:nmapscan).permit(:target, :port, :vuln, :safe, :os, :service_version, :zombie, :fragment))
    rail
      
#=end
  end
end
