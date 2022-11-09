class RemoveImagenFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :imagen, :string
  end
end
