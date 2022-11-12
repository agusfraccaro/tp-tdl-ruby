class RemoveDescripcionFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :descripcion, :string
  end
end
