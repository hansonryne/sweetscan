class CreateMasscans < ActiveRecord::Migration[5.1]
  def change
    create_table :masscans do |t|
      t.string :target
      t.string :rate
      t.string :filename

      t.timestamps
    end
  end
end
