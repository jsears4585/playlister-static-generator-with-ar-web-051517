class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.references :artist
      t.references :genre
    end
  end

  

  #isn't_slug: 'Action Bronson'
  #is_slug: 'action-bronson'
end
