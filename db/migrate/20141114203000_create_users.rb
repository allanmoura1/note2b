class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :password
      t.string :cpf

      t.index :cpf, unique: true

      t.timestamps
    end
  end
end
