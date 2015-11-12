class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :title
      t.string :features
      t.decimal :daily_rate

      t.timestamps null: false
    end
  end
end
