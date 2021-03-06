class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.string :title,        null: false
      t.text :text,           null: false
      t.integer :year_id,     null: false
      t.integer :month_id,    null: false
      t.integer :day_id,      null: false
      t.integer :hour_id,     null: false
      t.integer :minute_id,   null: false
      t.references :user,  foreign_key: true
      t.string :url_text
      t.float :rate,          null: false
      t.timestamps
    end
  end
end
