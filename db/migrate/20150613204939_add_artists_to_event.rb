class AddArtistsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :artists, :string
  end
end
