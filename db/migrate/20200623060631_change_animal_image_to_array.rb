class ChangeAnimalImageToArray < ActiveRecord::Migration[5.2]
  def change
    remove_column :animals, :image
    add_column :animals, :images, :text, :array => true, :default => []
  end
end
