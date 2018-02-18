class Nmapscan < ApplicationRecord
  before_validation :check_target, :check_port
  before_save :new_scan


  def check_target
    if not self.target =~ /^(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\.(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\.(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\.(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])$/
      flash[:notice] = "Your IP is wrong."
      redirect_to "/nmapscans/new"
      return
    end
  end
    
  def check_port
    if not self.port =~ /^.{1,5}$/
      flash[:notice] = "Your port is wrong"
      redirect_to "/nmapscans/new"
      return
    end
  end
  
  def new_scan
    params[:nmapscan][:filename] = datetime.to_formatted_s(:short)
    outfile = params[:nmapscan][:filename]
    
    command = "nmap "
    
    case params[:nmapscan][:speed]
      when "T1"
        command.concat("-T1 ")
      when "T2"
        command.concat("-T2 ")
      when "T3"
        command.concat("-T3 ")
      when "T4"
        command.concat("-T4 ")
      when "T5"
        command.concat("-T5 ")
      else
    end
    
    if params[:nmapscan][:ping].value_to_bool == false
      command.concat("-Pn ")
    end

  	if params[:nmapscan][:fragment] == "1"
  		command.concat("-f ")
  	end

  	if params[:nmapscan][:zombie] == "1"
  		command.concat("-sI  ")
  	end

  	if params[:nmapscan][:service_version] == "1"
  		command.concat("-sV ")
  	end

  	if params[:nmapscan][:os] == "1"
  		command.concat("-O ")
  	end

  	if params[:nmapscan][:safe] == "1"
  		command.concat("-sC ")
  	end

  	if params[:nmapscan][:vuln] == "1"
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

    puts "#{command} #{outfile}"
    #system "sudo #{command} -oX #{outfile} > /dev/null"
    #system "xsltproc #{outfile} -o #{outfile}.html"
    #render :file => "#{outfile}.html"
  end
  
end
