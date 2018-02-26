class Masscan < ApplicationRecord
  validates :target, :format => {:with => /\A(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\.(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\.(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\.(\w{1,2}|1\w{2}|2[0-4]\w|25[0-5])\z/,
                                 :message => " must be defined and in an IPv4 format."}
  
  before_destroy :cleanup_files

  def do_masscan
    datetime = DateTime.current
    self.filename = datetime.strftime("%Y%m%d%H%Mmasscan")
    outfile = self.filename
    
    command = "masscan -p1-65535 "
    
    case self.rate
      when "2000"
        command.concat("--rate=2000 ")
      when "3000"
        command.concat("--rate=3000 ")
      when "4000"
        command.concat("--rate=4000 ")
      when "5000"
        command.concat("--rate=5000 ")
      when "6000"
        command.concat("--rate=6000 ")
      when "7000"
        command.concat("--rate=7000 ")
      when "8000"
        command.concat("--rate=8000 ")
      when "9000"
        command.concat("--rate=9000 ")
      when "10000"
        command.concat("--rate=10000 ")
      else
        command.concat("--rate=1000 ")
    end
    
    command.concat("-p #{self.port} #{target}")
    
    #remove the > /dev/null eventually
    system "sudo #{command} -oX #{outfile} > /dev/null"
    system "rm -rf #{outfile}"
    
    self.save
  end
  
  def cleanup_files
    system "rm -rf public/masscans/#{self.filename}.html"
  end
  
end
