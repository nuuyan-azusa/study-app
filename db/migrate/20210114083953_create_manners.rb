class CreateManners < ActiveRecord::Migration[6.0]
  def change
    create_table :manners do |t|
      t.string :name,      null: false
      t.text :text,        null: false
      t.string :url_text
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
