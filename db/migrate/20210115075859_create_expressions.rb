class CreateExpressions < ActiveRecord::Migration[6.0]
  def change
    create_table :expressions do |t|

      t.timestamps
    end
  end
end
