class CreateQnas < ActiveRecord::Migration
  def change
    create_table :qnas do |t|

      t.timestamps null: false
    end
  end
end
