class CreateReceta < ActiveRecord::Migration[7.0]
  def change
    create_table :receta do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :nombre
      t.string :descripcion
      t.string :imagen

      t.timestamps
    end
  end
end
