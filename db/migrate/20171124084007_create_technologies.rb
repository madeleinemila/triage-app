class CreateTechnologies < ActiveRecord::Migration[5.1]
  def change
    create_table :technologies do |t|
      t.text :name
      t.text :links

      t.timestamps
    end
  end
end
