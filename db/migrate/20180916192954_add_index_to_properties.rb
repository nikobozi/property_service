class AddIndexToProperties < ActiveRecord::Migration[5.2]
  def change
    add_earthdistance_index :properties
  end
end
