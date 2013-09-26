class AddColoumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :contact, :string
    add_column :users, :hobby, :string
    add_column :users, :home_town, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :relationship_status, :boolean
    add_column :users, :interest_in, :string
    add_column :users, :language, :string
    add_column :users, :religion, :string
    add_column :users, :gender, :boolean
  end
end
