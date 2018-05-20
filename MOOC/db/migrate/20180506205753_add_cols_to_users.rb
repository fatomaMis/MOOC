class AddColsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :dob, :date
    add_column :users, :is_female, :boolean, default: false  #0 => Female , 1 => Male
    add_column :users, :pic, :string
  end
end
