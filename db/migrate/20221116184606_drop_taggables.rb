class DropTaggables < ActiveRecord::Migration[7.0]
  def change
    drop_table :taggables
  end
end
