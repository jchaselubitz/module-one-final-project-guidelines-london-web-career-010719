class AlteredIngredientsColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :ingredients, :drink_id, :cocktail_id
  end
end
