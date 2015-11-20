class AddMoreFieldsToCars < ActiveRecord::Migration
  def change
    add_column :cars, :image_file_name, :string
  end
end
