class ChangeDataTypeDob < ActiveRecord::Migration
  def change
    change_column :profiles, :dob, :date
  end
end
