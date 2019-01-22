class RemoveCocktailIngredienceTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :cocktails, :cocktail_ingredients_id
    drop_table :cocktail_ingredients_id
  end
end
