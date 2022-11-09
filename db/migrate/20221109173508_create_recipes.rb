class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :nombre
      t.belongs_to :user, null: false, foreign_key: true
      t.string :descripcion
      t.string :imagen

      t.timestamps
    end
  end
end
