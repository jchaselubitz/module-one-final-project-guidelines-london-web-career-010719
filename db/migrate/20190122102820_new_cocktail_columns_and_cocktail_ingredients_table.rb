class NewCocktailColumnsAndCocktailIngredientsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :cocktails, :idDrink, :integer
    add_column :cocktails, :strIBA, :string
    add_column :cocktails, :strInstructions, :string
    add_column :cocktails, :cocktail_ingredients_id, :integer

    create_table :cocktail_ingredients_id do |t|
      t.integer :ingredient_id
      t.integer :cocktail_id
    end
  end
end
