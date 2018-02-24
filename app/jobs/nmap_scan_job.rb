class NmapScanJob < ApplicationJob
  queue_as :default
  
  def perform(scan)
    scan.do_nmap_scan
  end
end
