class AddScopeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :scope, :string
  end
end
