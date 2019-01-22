class IntialDbCreation < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
    end

    create_table :ingredients do |t|
      t.string :name
      t.integer :drink_id
    end

    create_table :cocktails do |t|
      t.string :name
      t.integer :user_id
      #t.integer :idDrink
      #t.string :strIBA
      #t.string :strInstructions
      #t.integer :coctail-ingredients_id
    end
  end

end
