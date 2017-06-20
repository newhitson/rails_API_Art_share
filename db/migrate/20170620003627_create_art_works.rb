class CreateArtWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :art_works do |t|
      t.string :title, null: false, presence: true
      t.string :image_url, null: false, presence: true
      t.integer :artist_id
      t.timestamps
    end
    add_index :art_works, [:artist_id, :title], unique: true
    add_index :art_works, :artist_id
  end
end
