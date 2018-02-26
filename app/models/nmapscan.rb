class Nmapscan < ApplicationRecord
  validates :target, :format => {:with => /\A(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\.(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\.(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\.(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\z/,
                                 :message => " must be defined and in an IPv4 format."}
  validates :port, :format => {:with => /\A([1-9]|[1-9][0-9]{1,3}|[1-5][0-9]{0,4}|6[0-4][0-9]{0,3}|65[0-4][0-9]{0,2}|655[0-2][0-9]|6553[0-5])\z/,
                               :message => " must be a number between 1 and 65535."}
  
  before_destroy :cleanup_files
  
  def do_nmap_scan
    datetime = DateTime.current
    self.filename = datetime.strftime("%Y%m%d%H%Mnmap")
    outfile = self.filename
    
    command = "nmap "
    
    case self.speed
      when "1"
        command.concat("-T1 ")
      when "2"
        command.concat("-T2 ")
      when "3"
        command.concat("-T3 ")
      when "4"
        command.concat("-T4 ")
      when "5"
        command.concat("-T5 ")
      else
    end
    
    if self.ping == "off"
      command.concat("-Pn ")
    end

  	if self.fragment == "on"
  		command.concat("-f ")
  	end

  	#if self.zombie == "1"
  	#	command.concat("-sI  ")
  	#end

  	if self.service_version == "on"
  		command.concat("-sV ")
  	end

  	if self.os == "on"
  		command.concat("-O ")
  	end

  	if self.safe == "on"
  		command.concat("-sC ")
  	end

  	if self.vuln == "on"
  		command.concat("--script vuln ")
  	end
    
    command.concat("-p #{self.port} #{self.target}")
    
    #remove the > /dev/null eventually
    system "sudo #{command} -oX #{outfile} > /dev/null"
    system "xsltproc #{outfile} -o public/nmapscans/#{outfile}.html"
    system "rm -rf #{outfile}"
    
    self.save
  end
  
  def cleanup_files
    system "rm -rf public/nmapscans/#{self.filename}.html"
  end
end
