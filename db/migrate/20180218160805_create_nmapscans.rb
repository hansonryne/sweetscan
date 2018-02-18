class CreateNmapscans < ActiveRecord::Migration[5.1]
  def change
    create_table :nmapscans do |t|
      t.string :filename
      t.string :target
      t.string :port
      t.string :fragment
      t.string :os
      t.string :service_version
      t.string :safe
      t.string :vuln
      t.string :speed
      t.string :ping

      t.timestamps
    end
  end
end
