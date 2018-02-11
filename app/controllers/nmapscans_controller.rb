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

  	if params[:nmapscan][:port].present? == true
  		command.concat("-p #{params[:nmapscan][:port]} ")
  	end

    command.concat("#{params[:nmapscan][:target]}")

    system "#{command} > results.log"
    render :file => "results.log"
#=end
  end
end
