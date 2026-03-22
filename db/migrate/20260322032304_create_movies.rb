class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.integer :duration
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
