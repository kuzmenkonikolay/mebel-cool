class CreateIndexPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :index_pictures do |t|
      t.string :file
      t.string :type
    end
  end
end
