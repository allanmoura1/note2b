class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :numero_documento
      t.string :id_upload
      t.text :notes

      t.timestamps
    end
  end
end
