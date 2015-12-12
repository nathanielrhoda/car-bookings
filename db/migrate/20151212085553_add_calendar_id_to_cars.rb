class AddCalendarIdToCars < ActiveRecord::Migration
  def change
    add_column :cars, :calendar_id, :string
  end
end
